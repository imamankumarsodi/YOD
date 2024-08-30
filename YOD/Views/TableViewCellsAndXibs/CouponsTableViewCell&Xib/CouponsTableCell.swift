//
//  CouponsTableCell.swift
//  YOD
//
//  Created by Mac-As on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class CouponsTableCell: UITableViewCell {

    @IBOutlet weak var lbl_discount: UILabel!
    @IBOutlet weak var lbl_minimunPurchase: UILabel!
    @IBOutlet weak var lbl_code: UILabel!
    @IBOutlet weak var lbl_Date: UILabel!
    @IBOutlet weak var lbl_details: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
