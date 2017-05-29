//
//  ViewControllerDeviceDetails.swift
//  Monithor
//
//  Created by Cristina Salerno on 16/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class ViewControllerDeviceDetails: UITableViewController {

    @IBOutlet var deviceTable: UITableView!
    
    let details = [Details("Name:", "label"), Details("Room:", "label"), Details("Cathegory:", "label"), Details("Priority:", "label"), Details("Switch on:", "label"), Details("Connected at:", "label"), Details("KW/h used:", "label"), Details("Actually using:", "label")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.deviceTable.backgroundColor? = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
        self.deviceTable.tableFooterView = UIView()
        self.deviceTable.tableHeaderView = UIView()
        title = "\(details[0].stringa2) Device"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

}
