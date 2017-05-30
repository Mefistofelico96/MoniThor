//
//  ViewControllerDeviceDetails.swift
//  Monithor
//
//  Created by Cristina Salerno on 16/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class ViewControllerDeviceDetails: UITableViewController {

    // @IBOutlet var deviceTable: DeviceDetailsTableView!
    @IBOutlet var editButton: UIBarButtonItem!
    
    public var statoFromHome = 0
    public var statoTimer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
//        self.deviceTable.backgroundColor? = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
//        self.deviceTable.tableFooterView = UIView()
//        self.deviceTable.tableHeaderView = UIView()
        navigationItem.rightBarButtonItems = [editButton]
        // let details = [Details("Name:", ""), Details("Room:", ""), Details("Cathegory:", ""), Details("Priority:", ""), Details("Switch on:", ""), Details("Connected at:", ""), Details("KW/h used:", ""), Details("Actually using:", "")]
        
        // deviceTable.cellaNome.label2.text = nomeDevice
        
        // title = "\(details[0].stringa2) Device"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // codice
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
