//
//  ViewControllerPowerStripDetails.swift
//  Monithor
//
//  Created by Cristina Salerno on 16/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class ViewControllerPowerStripDetails: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var labelPowerStripName: UILabel!
    @IBOutlet weak var labelPowerStripRoom: UILabel!
    @IBOutlet weak var labelKWhUsed: UILabel!
    @IBOutlet weak var tableViewPowerStripDetails: UITableView!
    
    public var presaFromHome = DB_Presa()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.tableViewPowerStripDetails.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.tableViewPowerStripDetails.tableFooterView = UIView()
        self.tableViewPowerStripDetails.tableHeaderView = UIView()

        title = "\(labelPowerStripName.text!) Power Strip"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: "powerStripDetailsCell", for: indexPath) as! TableViewCellPowerStripDetails
        
        return aCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDeviceDetails", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Passaggio dati
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DeviceDetailsTableViewController {
            destination.nome = "presa1"
            destination.statoTim = 1 // timer.getStatoTimer
        }
        
    }
    
}
