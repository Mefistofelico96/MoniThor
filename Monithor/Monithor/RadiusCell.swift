//
//  RadiusCell.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 19/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class RadiusCell: UITableViewCell {
    
    @IBOutlet public weak var radiusTextField: UITextField!
    @IBOutlet public weak var noteTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 245/255, green: 254/255, blue: 247/255, alpha: 1.0)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
