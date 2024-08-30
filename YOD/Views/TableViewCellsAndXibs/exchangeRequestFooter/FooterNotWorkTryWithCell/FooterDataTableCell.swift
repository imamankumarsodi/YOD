//
//  FooterDataTableCell.swift
//  YOD
//
//  Created by Syed Zuber on 29/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class FooterDataTableCell: UITableViewCell {

    @IBOutlet weak var btn_AddAddress: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func btn_AddNewAddress(_ sender: Any) {
    }
    
    
    
    
}
