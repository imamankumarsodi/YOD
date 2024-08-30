//
//  SearchTableViewCellAndXib.swift
//  YOD
//
//  Created by abc on 22/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SearchTableViewCellAndXib: UITableViewCell {

    @IBOutlet weak var lbl_SearchResult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
