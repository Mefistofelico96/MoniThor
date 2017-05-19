//
//  RadiusCell.swift
//  Monithor
//
//  Created by Alessandro Ilardi Garofalo on 19/05/17.
//  Copyright © 2017 Pipsqueaks. All rights reserved.
//

import UIKit

class RadiusCell: UITableViewCell {
    
    @IBOutlet weak var radiusTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
