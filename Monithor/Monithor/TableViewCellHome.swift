//
//  TableViewCellHome.swift
//  Monithor
//
//  Created by Cristina Salerno on 18/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class TableViewCellHome: UITableViewCell {

    @IBOutlet weak var deviceImage: UIImageView!
    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var connectedTime: UILabel!
    @IBOutlet weak var timerBegin: UILabel!
    @IBOutlet weak var timerEnd: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var switchStateTimer: UISwitch!
    
    public var idCharlie = -1
    public var statoFromHome = 0
    public var statoTimer = 0
    public var idFromHome = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buttonUpdateSato(_ sender: Any) {
        
        if statoFromHome == 0 {
            self.statusButton.setImage(#imageLiteral(resourceName: "Power Button ON"), for: .normal)
            statoFromHome = 1
        }
        else {
            self.statusButton.setImage(#imageLiteral(resourceName: "Power Button OFF"), for: .normal)
            statoFromHome = 0
        }
        
        let URL_Update_stato = "http://10.20.40.24/monithor/api/UpdateStato.php"
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "stato=\(statoFromHome)&id=\(idCharlie + 1)"
        
        
        
        //created NSURL
        let requestURL = NSURL(string: URL_Update_stato)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg)
                    
                }
            } catch {
                print(error)
            }
            
        }
        //executing the task
        task.resume()
        
    }
    
//    @IBAction func switchState(_ sender: Any) {
//        
//        if statoTimer == 0 {
//            self.switchStateTimer.isEnabled = true
//            statoTimer = 1
//        }
//        else {
//            self.switchStateTimer.isEnabled = false
//            statoTimer = 0
//        }
//        
//        let stato_timer = statoTimer
//        let id_presa = idFromHome
//        let URL_Update_StatoTimer = "http://10.20.40.24/monithor/api/Update_StatoTimer.php"
//        
//        //creating the post parameter by concatenating the keys and values from text field
//        let postParameters = "stato_timer=\(stato_timer)&id_presa=\(id_presa)"
//        
//        //created NSURL
//        let requestURL = NSURL(string: URL_Update_StatoTimer)
//        
//        //creating NSMutableURLRequest
//        let request = NSMutableURLRequest(url: requestURL! as URL)
//        
//        //setting the method to post
//        request.httpMethod = "POST"
//        
//        
//        
//        
//        //adding the parameters to request body
//        request.httpBody = postParameters.data(using: String.Encoding.utf8)
//        
//        
//        //creating a task to send the post request
//        let task = URLSession.shared.dataTask(with: request as URLRequest){
//            data, response, error in
//            
//            if error != nil{
//                print("error is \(String(describing: error))")
//                return;
//            }
//            
//            //parsing the response
//            do {
//                //converting resonse to NSDictionary
//                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//                
//                //parsing the json
//                if let parseJSON = myJSON {
//                    
//                    //creating a string
//                    var msg : String!
//                    
//                    //getting the json response
//                    msg = parseJSON["message"] as! String?
//                    
//                    //printing the response
//                    print(msg)
//                    
//                }
//            } catch {
//                print(error)
//            }
//            
//        }
//        //executing the task
//        task.resume()
//    }
    
    
}
