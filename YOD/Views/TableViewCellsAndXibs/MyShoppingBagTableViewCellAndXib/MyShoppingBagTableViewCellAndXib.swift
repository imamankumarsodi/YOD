//
//  MyShoppingBagTableViewCellAndXib.swift
//  YOD
//
//  Created by abc on 04/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyShoppingBagTableViewCellAndXib: UITableViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblSoldBy: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
