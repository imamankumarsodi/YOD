//
//  OptionsMyBagCell.swift
//  YOD
//
//  Created by Mac-As on 25/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class OptionsMyBagCell: UITableViewCell {

    @IBOutlet weak var lbl_Option: UILabel!
    @IBOutlet weak var btn_Coupon: UIButton!
    @IBOutlet weak var optionViewHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
