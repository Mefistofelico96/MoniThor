//
//  ViewControllerSettings.swift
//  Monithor
//
//  Created by Cristina Salerno on 16/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class ViewControllerSettings: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var labelEnergyMonth: UILabel!
    @IBOutlet weak var labelEnergyWeek: UILabel!
    @IBOutlet weak var labelEnergyDay: UILabel!
    
    @IBOutlet weak var labelMoneyMonth: UILabel!
    @IBOutlet weak var labelMoneyWeek: UILabel!
    @IBOutlet weak var labelMoneyDay: UILabel!
    
    @IBOutlet weak var tableViewSettings: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(red: 10/255, green: 65/255, blue: 84/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 174/255, green: 227/255, blue: 208/255, alpha: 1)
        self.view.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
        self.tableViewSettings.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let aCell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! TableViewCellSettings
        
        return aCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}