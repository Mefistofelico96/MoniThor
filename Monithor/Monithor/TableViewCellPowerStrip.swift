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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
