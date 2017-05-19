//
//  TableViewCellSettings.swift
//  Monithor
//
//  Created by Cristina Salerno on 18/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class TableViewCellSettings: UITableViewCell {

    @IBOutlet weak var imageSetting: UIImageView!
    @IBOutlet weak var labelSettingName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 236/255, green: 254/255, blue: 240/255, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
