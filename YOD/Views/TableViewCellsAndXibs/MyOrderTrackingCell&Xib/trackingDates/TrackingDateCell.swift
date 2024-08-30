//
//  TrackingDateCell.swift
//  YOD
//
//  Created by Syed Zuber on 28/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class TrackingDateCell: UITableViewCell {

    
    @IBOutlet weak var lbl_Date: UILabel!
    @IBOutlet weak var lbl_shippingStatus: UILabel!
    @IBOutlet weak var line_view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
