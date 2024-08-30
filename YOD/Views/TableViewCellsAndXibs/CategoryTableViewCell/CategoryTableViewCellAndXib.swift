//
//  CategoryTableViewCellAndXib.swift
//  YOD
//
//  Created by abc on 22/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class CategoryTableViewCellAndXib: UITableViewCell {

    @IBOutlet weak var leadingConstraintForDropDown: NSLayoutConstraint!
   
    @IBOutlet weak var constraintLeading: NSLayoutConstraint!
    //MARK: - OUTLETS
    @IBOutlet weak var imgDropDown: UIImageView!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
 
    
}
