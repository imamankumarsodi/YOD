//
//  ProductDetailsTableViewCell.swift
//  YOD
//
//  Created by abc on 23/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {
    //MARK: - OUTLET
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var leadingNSLayoutConstraintlblDetail: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
