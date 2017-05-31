//
//  DeviceDetailsTableViewController.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 30/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class DeviceDetailsTableViewController: UITableViewController {
    
    @IBOutlet var deviceTable: DevicesDetailsTableView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var roomText: UITextField!
    @IBOutlet weak var timerOnText: UITextField!
    @IBOutlet weak var timerOffText: UITextField!
    
    var editButton: UIBarButtonItem!
    
    public var nome = ""
    public var statoTim = 0
    public var timerOn = ""
    public var timerOff = ""
    public var idNicola = -1
    //public var ciabatta = DB_Presa()
    
    public var lettura = 0
    public var quando = ""
    
    let raspID = "10.20.40.24"
    var plugTypes: [Cathegory] = []
    public var idPlug = 0
    
    func setCathegory () {
        plugTypes.append(Cathegory(name: "Coffee Machine", image: #imageLiteral(resourceName: "CoffeeMachine")))
        plugTypes.append(Cathegory(name: "Washing Machine", image: #imageLiteral(resourceName: "WashingMachine")))
        plugTypes.append(Cathegory(name: "Air Cooler", image: #imageLiteral(resourceName: "Cooler")))
        plugTypes.append(Cathegory(name: "TV", image: #imageLiteral(resourceName: "TV")))
        plugTypes.append(Cathegory(name: "Game Console", image: #imageLiteral(resourceName: "PS4")))
        plugTypes.append(Cathegory(name: "Vacuum Cleaner", image: #imageLiteral(resourceName: "Vacuum")))
        plugTypes.append(Cathegory(name: "Dish Washer", image: #imageLiteral(resourceName: "Dishwasher")))
        plugTypes.append(Cathegory(name: "Printer", image: #imageLiteral(resourceName: "Copymachine")))
        plugTypes.append(Cathegory(name: "PC", image: #imageLiteral(resourceName: "PC")))
        plugTypes.append(Cathegory(name: "Mobile Phone", image: #imageLiteral(resourceName: "iPhone")))
        plugTypes.append(Cathegory(name: "Alarm", image: #imageLiteral(resourceName: "Alarm")))
        plugTypes.append(Cathegory(name: "Heater", image: #imageLiteral(resourceName: "Heater")))
        plugTypes.append(Cathegory(name: "Lamp", image: #imageLiteral(resourceName: "Lamp")))
        plugTypes.append(Cathegory(name: "Name", image: #imageLiteral(resourceName: "Air cond")))
        plugTypes.append(Cathegory(name: "Mac Charger", image: #imageLiteral(resourceName: "Mac Charger")))
        plugTypes.append(Cathegory(name: "Food Steamer", image: #imageLiteral(resourceName: "Bimby")))
        plugTypes.append(Cathegory(name: "Telephone", image: #imageLiteral(resourceName: "Telephone")))
        plugTypes.append(Cathegory(name: "CD Player", image: #imageLiteral(resourceName: "CD Player")))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCathegory()
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.deviceTable.backgroundColor? = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.deviceTable.tableFooterView = UIView()
        self.deviceTable.tableHeaderView = UIView()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        if statoTim == 0 {
            deviceTable.timerCell.switchTimer.isOn = false
        }
        else {
            deviceTable.timerCell.switchTimer.isOn = true
        }
        
        let details = [Details("Name:", ""), Details("Room:", "Kitchen"), Details("Cathegory:", ""), Details("Priority:", ""), Details("Switch on:", ""), Details("Connected at:", ""), Details("KW/h used:", ""), Details("Actually using:", "")]

        title = "\(details[0].stringa2) Device"
        
        self.editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.edit))
        navigationItem.rightBarButtonItem = self.editButton
        
        deviceTable.nameCell.label2.text = nome
        deviceTable.roomCell.label2.text = "Kitchen"
        deviceTable.priorityCell.label2.text = "Medium"
        deviceTable.timerCell.label2.text = timerOn
        deviceTable.timerCell.label.text = timerOff
        
        deviceTable.consumptionCell.label2.text = String(format: "%.2f", Float(abs(lettura)) / 10000)
        deviceTable.connectedCell.label2.text = quando
        
        nameText.isEnabled = false
        roomText.isEnabled = false
        nameText.isHidden = true
        roomText.isHidden = true
        deviceTable.cathegoryCell.label2.text = plugTypes[idPlug].name
        deviceTable.cathegoryCell.categoryButton.imageView?.image = plugTypes[idPlug].image
        
        deviceTable.priorityCell.label2.isHidden = false
        deviceTable.priorityCell.highButton.isHidden = true
        deviceTable.priorityCell.mediumButton.isHidden = true
        deviceTable.priorityCell.lowButton.isHidden = true
        
        deviceTable.timerCell.label2.isHidden = false
        deviceTable.timerCell.label.isHidden = false
        timerOnText.isHidden = true
        timerOffText.isHidden = true
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.deviceTable.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.deviceTable.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Abilita editor
    func edit () {
        
        nameText.text! = deviceTable.nameCell.label2.text!
        roomText.text! = deviceTable.roomCell.label2.text!
        timerOnText.text! = deviceTable.timerCell.label2.text!
        timerOffText.text! = deviceTable.timerCell.label.text!
        
        nameText.isEnabled = true
        roomText.isEnabled = true
        nameText.isHidden = false
        roomText.isHidden = false
        
        deviceTable.priorityCell.label2.isHidden = true
        deviceTable.priorityCell.highButton.isHidden = false
        deviceTable.priorityCell.mediumButton.isHidden = false
        deviceTable.priorityCell.lowButton.isHidden = false
        
        deviceTable.timerCell.label2.isHidden = true
        deviceTable.timerCell.label.isHidden = true
        timerOnText.isHidden = false
        timerOffText.isHidden = false
        
        self.editButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.done))
        navigationItem.rightBarButtonItem = self.editButton
    }
    
    // Post cambiamenti
    func done () {
        self.view.endEditing(true)
        nameText.isEnabled = false
        roomText.isEnabled = false
        nameText.isHidden = true
        roomText.isHidden = true
        
        deviceTable.priorityCell.label2.isHidden = false
        deviceTable.priorityCell.highButton.isHidden = true
        deviceTable.priorityCell.mediumButton.isHidden = true
        deviceTable.priorityCell.lowButton.isHidden = true
        
        deviceTable.timerCell.label2.isHidden = false
        deviceTable.timerCell.label.isHidden = false
        timerOnText.isHidden = true
        timerOffText.isHidden = true
        
        self.editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(self.edit))
        navigationItem.rightBarButtonItem = self.editButton
        
        // Funzioni post
        updateName()
        updateTimerOn()
        updateTimerOff()
        
        // Cambiamento labels
        deviceTable.nameCell.label2.text = nameText.text!
        deviceTable.roomCell.label2.text = roomText.text!
        deviceTable.timerCell.label2.text = timerOnText.text!
        deviceTable.timerCell.label.text = timerOffText.text!
        
        // Refresh
        self.deviceTable.reloadData()
        
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
    
    func updateName () {
        
        let URL_Update_nome = "http://\(raspID)/monithor/api/UpdateNome.php"
        
        // Creating the post parameter by concatenating the keys and values from text field
        let postParameters = "nome=\(nameText.text!)&id=\(idNicola)";
        
        // Created NSURL
        let requestURL = NSURL(string: URL_Update_nome)
        
        // Creating NSMutableURLRequest
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
    
    func updateTimerOn () {
        
        let URL_Update_TimerOn = "http://\(raspID)/monithor/api/Update_TimerOn.php"
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "timer_on=\(timerOnText.text!)&id_presa=\(idNicola)"
        
        //created NSURL
        let requestURL = NSURL(string: URL_Update_TimerOn)
        
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
    
    func updateTimerOff () {
        
        let URL_Update_TimerOff = "http://\(raspID)/monithor/api/Update_TimerOff.php"
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "timer_off=\(timerOffText.text!)&id_presa=\(idNicola)"
        
        //created NSURL
        let requestURL = NSURL(string: URL_Update_TimerOff)
        
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
                
                // Parsing the json
                if let parseJSON = myJSON {
                    var msg: String!
                    msg = parseJSON["message"] as! String?
                    print(msg)
                }
            } catch {
                print(error)
            }
            
        }
        // Executing the task
        task.resume()
    }
    
    @IBAction func switchState(_ sender: Any) {
        
        if statoTim == 0 {
            deviceTable.timerCell.switchTimer.isOn = true
            statoTim = 1
        }
        else {
            deviceTable.timerCell.switchTimer.isOn = false
            statoTim = 0
        }
        
        let URL_Update_StatoTimer = "http://\(raspID)/monithor/api/Update_StatoTimer.php"
        
        // Creating the post parameter by concatenating the keys and values from text field
        let postParameters = "stato_timer=\(statoTim)&id_presa=\(idNicola)"
        
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
    
    @IBAction func highButtonAct(_ sender: Any) {
        deviceTable.priorityCell.label2.text = "High"
        // Codice
    }
    
    @IBAction func mediumButtonAct(_ sender: Any) {
        deviceTable.priorityCell.label2.text = "Medium"
        // Codice
    }
    
    @IBAction func lowButtonAct(_ sender: Any) {
        deviceTable.priorityCell.label2.text = "Low"
        // Codice
    }
    
    @IBAction func categoryButton(_ sender: Any) {
        // code
        
    }
    
    // Passaggio dati
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewControllerHome {
            destination.presaClass[idNicola].setNome(nameText.text!)
            destination.presaClass[idNicola].db_timer.setStatoTimer(statoTim)
            
        }
        
    }
    
    

}
