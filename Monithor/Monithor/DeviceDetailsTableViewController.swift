//
//  DeviceDetailsTableViewController.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 30/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class DeviceDetailsTableViewController: UITableViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var roomText: UITextField!
    @IBOutlet var deviceTable: DevicesDetailsTableView!
    var editButton: UIBarButtonItem!

    @IBOutlet weak var highButton: UIButton!
    @IBAction func highButtonAct(_ sender: Any) {
    }
    @IBOutlet weak var mediumButton: UIButton!
    @IBAction func mediumButtonAct(_ sender: Any) {
        
    }
    @IBOutlet weak var lowButton: UIButton!
    @IBAction func lowButtonAct(_ sender: Any) {
        
    }
    @IBOutlet weak var priorityLabel: UILabel!
    let raspID = "10.20.40.24"
    
    public var nome = ""
    public var stato = 0
    public var idNicola = -1
    public var ciabatta = DB_Presa()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.deviceTable.backgroundColor? = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.deviceTable.tableFooterView = UIView()
        self.deviceTable.tableHeaderView = UIView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        if stato == 0 {
            deviceTable.timerCell.switchTimer.isOn = false
        }
        else {
            deviceTable.timerCell.switchTimer.isOn = true
        }
        
        let details = [Details("Name:", ""), Details("Room:", ""), Details("Cathegory:", ""), Details("Priority:", ""), Details("Switch on:", ""), Details("Connected at:", ""), Details("KW/h used:", ""), Details("Actually using:", "")]

        title = "\(details[0].stringa2) Device"
        
        deviceTable.nameCell.label2.text = nome
        self.editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.edit))
        navigationItem.rightBarButtonItem = self.editButton
        
        nameText.isEnabled = false
        roomText.isEnabled = false
        nameText.isHidden = true
        roomText.isHidden = true
        highButton.isHidden = true
        mediumButton.isHidden = true
        lowButton.isHidden = true
    }
    
    // Abilita editor
    func edit () {
        nameText.isEnabled = true
        roomText.isEnabled = true
        nameText.isHidden = false
        roomText.isHidden = false
        highButton.isHidden = false
        mediumButton.isHidden = false
        lowButton.isHidden = false
        priorityLabel.isHidden = true
        self.editButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.done))
        navigationItem.rightBarButtonItem = self.editButton
    }
    
    // Post cambiamenti
    func done () {
        nameText.isEnabled = false
        roomText.isEnabled = false
        nameText.isHidden = true
        roomText.isHidden = true
        highButton.isHidden = true
        mediumButton.isHidden = true
        lowButton.isHidden = true
        priorityLabel.isHidden = false
        self.editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.edit))
        navigationItem.rightBarButtonItem = self.editButton
        updateName()
        deviceTable.nameCell.label2.text = nameText.text!
        
    }

    func updateName () {
        
        let URL_Update_nome = "http://\(raspID)/monithor/api/UpdateNome.php"
        //        URL_Update_nome += "?nome=\(nome)"
        //        URL_Update_nome += "&id=\(id)"
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "nome=\(nameText.text!)&id=\(idNicola)";
        
        //created NSURL
        let requestURL = NSURL(string: URL_Update_nome)
        
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        
        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */
 
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func switchState(_ sender: Any) {
        
        if stato == 0 {
            deviceTable.timerCell.switchTimer.isOn = true
            stato = 1
        }
        else {
            deviceTable.timerCell.switchTimer.isOn = false
            stato = 0
        }
        
        let URL_Update_StatoTimer = "http://\(raspID)/monithor/api/Update_StatoTimer.php"
        
        // Creating the post parameter by concatenating the keys and values from text field
        let postParameters = "stato_timer=\(stato)&id_presa=\(idNicola)"
        
        // Created NSURL
        let requestURL = NSURL(string: URL_Update_StatoTimer)
        
        // Creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        // Setting the method to post
        request.httpMethod = "POST"
        
        // Adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        // Creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(String(describing: error))")
                return;
            }
            
            // Parsing the response
            do {
                // Converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                // Parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg: String!
                    
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
    
    @IBAction func categoryButton(_ sender: Any) {
        // code
        
    }
    
    
    

}
