//
//  SavedScreenCell.swift
//  YOD
//
//  Created by Mac-As on 30/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SavedScreenCell: UITableViewCell {

    @IBOutlet weak var img_CardType: UIImageView!
    @IBOutlet weak var btn_Selection: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
