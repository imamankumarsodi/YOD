//
//  MyAddressTableViewCellAndXib.swift
//  YOD
//
//  Created by abc on 09/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyAddressTableViewCellAndXib: UITableViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var lblBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var viewButtons: UIView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnRemoveRef: UIButton!
    @IBOutlet weak var btnEditRef: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
