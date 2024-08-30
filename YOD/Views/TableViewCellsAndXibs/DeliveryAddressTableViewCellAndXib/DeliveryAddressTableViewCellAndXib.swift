//
//  DeliveryAddressTableViewCellAndXib.swift
//  YOD
//
//  Created by abc on 05/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class DeliveryAddressTableViewCellAndXib: UITableViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var titleLeadingConstraints: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
