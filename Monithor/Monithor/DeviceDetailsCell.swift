//
//  DeviceDetailsCell.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 24/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class DeviceDetailsCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var switchTimer : UISwitch!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
