//
//  MyOrderTableViewCellAndXib.swift
//  YOD
//
//  Created by abc on 06/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyOrderTableViewCellAndXib: UITableViewCell {
    //MARK: - OUTLETS
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblOrderId: UILabel!
    @IBOutlet weak var btnReturnRef: UIButton!
    @IBOutlet weak var btnExchangeRef: UIButton!
    @IBOutlet weak var btnCancelOrder: UIButton!
    @IBOutlet weak var btnTrackOrder: UIButton!
    
    @IBOutlet weak var btn_retrunExchnageStack: UIStackView!
    @IBOutlet weak var btn_CancelTrackStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
