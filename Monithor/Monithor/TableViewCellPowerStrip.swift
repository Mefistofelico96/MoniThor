//
//  TableViewCellPowerStrip.swift
//  Monithor
//
//  Created by Cristina Salerno on 17/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class TableViewCellPowerStrip: UITableViewCell {

    @IBOutlet weak var imageSocket1: UIImageView!
    @IBOutlet weak var imageSocket2: UIImageView!
    @IBOutlet weak var imageSocket3: UIImageView!
    @IBOutlet weak var imageSocket4: UIImageView!
    @IBOutlet weak var imageSocket5: UIImageView!
    @IBOutlet weak var powerStripName: UILabel!
    @IBOutlet weak var powerStripRoom: UILabel!
    @IBOutlet weak var numberConnectedDevice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
