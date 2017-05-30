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
    @IBOutlet weak var newNameTextfield: UITextField!
    @IBOutlet weak var editButtonOutlet: UIButton!
    @IBOutlet weak var doneButtonOutlet: UIButton!
    @IBOutlet var refreshButton: UIBarButtonItem!
    
    let defaults = UserDefaults.standard
    
    var presaClass = [DB_Presa]()
    var timerClass = [DB_Timer]()
    
    var raspIP = "10.20.40.24"
    var idCellaSelezionata = 0
    var counter = 0
    
    @IBAction func editButton(_ sender: Any) {
        labelUserName.text = "New name:"
        newNameTextfield.isHidden = false
        doneButtonOutlet.isHidden = false
        editButtonOutlet.isHidden = true
    }
    
    @IBAction func doneButton(_ sender: Any) {
        defaults.set("\(newNameTextfield.text!)", forKey: "username")
        labelUserName.text = newNameTextfield.text!
        newNameTextfield.isHidden = true
        doneButtonOutlet.isHidden = true
        editButtonOutlet.isHidden = false
        self.view.endEditing(true)
    }
    
    @IBAction func refresh(_ sender: Any) {
        self.getPresa()
        self.homeTableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabBarController?.tabBar.barTintColor = UIColor(colorLiteralRed: 174/255, green: 227/255, blue: 208/255, alpha: 1)
        tabBarController?.tabBar.tintColor = UIColor(colorLiteralRed: 10/255, green: 65/255, blue: 84/255, alpha: 1)
        tabBarController?.tabBar.unselectedItemTintColor = UIColor(colorLiteralRed: 53/255, green: 134/255, blue: 140/255, alpha: 1)

        navigationController?.navigationBar.tintColor = UIColor(red: 10/255, green: 65/255, blue: 84/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 174/255, green: 227/255, blue: 208/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor(red: 10/255, green: 65/255, blue: 84/255, alpha: 1)]
        navigationItem.rightBarButtonItems = [refreshButton]
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.tableViewHome.backgroundColor? = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.tableViewHome.tableFooterView = UIView()
        self.tableViewHome.tableHeaderView = UIView()
        labelUserName.text = "User"
        labelUserName.text = defaults.object(forKey: "username") as? String
        if defaults.object(forKey: "username") as? String == "" {
            labelUserName.text = "Default User"
        }
        labelNumberPowerStrip.text = "\(counter) Power Strips connected"
        newNameTextfield.isHidden = true
        doneButtonOutlet.isHidden = true
        
        self.getPresa()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getPresa () {
        
        // Our web service url
        let URL_GET_SCARPETTE:String = "http://\(raspIP)/monithor/api/GetPresa.php"
        
        // Created NSURL
        let requestURL = NSURL(string: URL_GET_SCARPETTE)
        
        // Creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        // Setting the method to post
        request.httpMethod = "GET"
        
        // Creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            // Exiting if there is some error
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            // Parsing the response
            do {
                
                // Converting resonse to NSDictionary
                var presaJSON: NSDictionary!
                presaJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                var prese = presaJSON["presa"] as! [NSDictionary]
                dump(prese)
                
                for i in 0 ..< prese.count {
                    
                    // Getting the data at each index
                    let powerStrip = DB_Presa()
                    powerStrip.setID(prese[i]["id"] as! Int!)
                    powerStrip.setNome(prese[i]["nome"] as! String!)
                    powerStrip.setStato(prese[i]["stato"] as! Int!)
                    self.presaClass.append(powerStrip)
                    
                    // Funzione timer
                    self.getTimer(i)
                    
                }
                self.homeTableView.reloadData()
                self.view.setNeedsDisplay()
            } catch {
                print(error)
            }
        }
        // Executing the task
        task.resume()
    }
    
    func getTimer (_ i: Int) {
        
        var URL_GET_Timer = "http://\(raspIP)/monithor/api/GetTimer.php"
        URL_GET_Timer += "?id=\(presaClass[i].getId)"
        
        // Created NSURL
        let requestURL = NSURL(string: URL_GET_Timer)
        
        // Creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        // Setting the method to post
        request.httpMethod = "GET"
        
        // Creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            // Exiting if there is some error
            if error != nil{
                print("Error is \(String(describing: error))")
                return;
            }
            
            // Parsing the response
            do {
                // Converting resonse to NSDictionary
                var timerJSON: NSDictionary!
                timerJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                let timers = timerJSON["timer"] as! [NSDictionary]
                dump(timers)
                
                for j in 0 ..< timers.count {
                    
                    // Getting the data at each index
                    let timer = DB_Timer()
                    
                    var timerOn = ""
                    var timerOff = ""
                    timerOn = timers[j]["timer_on"] as! String!
                    timerOff = timers[j]["timer_on"] as! String!
                    
                    let indextimerOn = timerOn.index(timerOn.startIndex, offsetBy: 5)
                    timerOn = timerOn.substring(to: indextimerOn)
                    
                    let indextimerOff = timerOff.index(timerOff.startIndex, offsetBy: 5)
                    timerOff = timerOff.substring(to: indextimerOff)
                    
                    timer.setStatoTimer(timers[j]["stato_timer"] as! Int!)
                    timer.setTimerOn(timerOn)
                    timer.setTimerOff(timerOff)
                    self.presaClass[i].db_timer = timer
                    
                    timer.setStatoTimer(timers[j]["stato_timer"] as! Int!)
                    self.presaClass[i].db_timer = timer
                    
                }
                self.homeTableView.reloadData()
                self.view.setNeedsDisplay()
            } catch {
                print(error)
            }
        }
        // Executing the task
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presaClass.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! TableViewCellHome
        
        aCell.deviceName.text = presaClass[indexPath.row].getNome
        
        // Bottone presa
        if self.presaClass[indexPath.row].getStato == 0 {
            aCell.statusButton.imageView?.image = #imageLiteral(resourceName: "Power Button OFF")
        }
        else {
            aCell.statusButton.imageView?.image = #imageLiteral(resourceName: "Power Button ON")
        }
        
        aCell.idCharlie = indexPath.row
        
        return aCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDeviceDetailsHome", sender: nil)
        //idCellaSelezionata = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        idCellaSelezionata = indexPath.row
        return indexPath
    }
    
    // Passaggio dati
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination1 = segue.destination as? TableViewCellHome {
            destination1.statoFromHome = presaClass[idCellaSelezionata].getStato
            destination1.statoTimer = timerClass[idCellaSelezionata].getStatoTimer
            
        }
        if let destination2 = segue.destination as? DeviceDetailsTableViewController {
//            destination2.ciabatta.setNome(presaClass[idCellaSelezionata].getNome)
//            destination2.ciabatta.db_timer.setStatoTimer(presaClass[idCellaSelezionata].db_timer.getStatoTimer)
            destination2.nome = presaClass[idCellaSelezionata].getNome
            destination2.stato = presaClass[idCellaSelezionata].db_timer.getStatoTimer
            
            destination2.idNicola = presaClass[idCellaSelezionata].getId
            
        }
        
    }
    
}
