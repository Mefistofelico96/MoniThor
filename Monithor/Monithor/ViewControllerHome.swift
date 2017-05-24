//
//  ViewController.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 15/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class ViewControllerHome: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelNumberPowerStrip: UILabel!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var tableViewHome: UITableView!
    @IBOutlet weak var homeTableView: UITableView!
    
    var presaClass = [DB_Presa]()
    
    var idCellaSelezionata = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(red: 10/255, green: 65/255, blue: 84/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 174/255, green: 227/255, blue: 208/255, alpha: 1)
        tabBarController?.tabBar.barTintColor = UIColor(colorLiteralRed: 174/255, green: 227/255, blue: 208/255, alpha: 1)
        tabBarController?.tabBar.tintColor = UIColor(colorLiteralRed: 10/255, green: 65/255, blue: 84/255, alpha: 1)
        tabBarController?.tabBar.unselectedItemTintColor = UIColor(colorLiteralRed: 53/255, green: 134/255, blue: 140/255, alpha: 1)
        self.view.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
        self.tableViewHome.backgroundColor? = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
        self.getPresa()
    }
    
    func getPresa () {
        //Our web service url
        let URL_GET_SCARPETTE:String = "http://10.20.40.24/monithor/api/GetPresa.php"
        
        //created NSURL
        let requestURL = NSURL(string: URL_GET_SCARPETTE)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "GET"
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            //exiting if there is some error
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            //parsing the response
            
            do {
                
                //converting resonse to NSDictionary
                var presaJSON: NSDictionary!
                presaJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                var prese = presaJSON["presa"] as! [NSDictionary]
                dump(prese)
                
                for i in 0 ..< prese.count{
                    
                    // Getting the data at each index
                    
                    let powerStrip = DB_Presa()
                    powerStrip.setID(prese[i]["id"] as! Int!)
                    powerStrip.setNome(prese[i]["nome"] as! String!)
                    powerStrip.setStato(prese[i]["stato"] as! Int!)
                    self.presaClass.append(powerStrip)
                    
                    // Funzione timer
                    
                }
                self.homeTableView.reloadData()
                self.view.setNeedsDisplay()
            } catch {
                print(error)
            }
        }
        //executing the task
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presaClass.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! TableViewCellHome
        aCell.deviceName.text = presaClass[indexPath.row].getNome
        if presaClass[indexPath.row].getStato == 0 {
            aCell.statusButton.imageView?.image = #imageLiteral(resourceName: "Power Button OFF")
        }
        else {
            aCell.statusButton.imageView?.image = #imageLiteral(resourceName: "Power Button ON")
        }
        aCell.idCharlie = indexPath.row
        return aCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDeviceDetails", sender: nil)
        idCellaSelezionata = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? TableViewCellHome {
            dest.statoFromHome = presaClass[idCellaSelezionata].getStato
            dest.idFromHome = presaClass[idCellaSelezionata].getId
        }
//        if let dest = segue.destination as? CollectionViewController {
//            dest.people = persone
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
