//
//  HandipickedTable.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class HandipickedTable: UITableViewCell {

    @IBOutlet weak var handPickedTable: UITableView!
    
    var comingNAV = UIViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "HandPickedCell", bundle: nil)
        handPickedTable.register(nib, forCellReuseIdentifier: "HandPickedCell")
        handPickedTable.delegate = self
        handPickedTable.dataSource = self
        
        handPickedTable.isScrollEnabled = false //Disable scroll
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HandipickedTable: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = handPickedTable.dequeueReusableCell(withIdentifier: "HandPickedCell", for: indexPath) as! HandPickedCell
        
        if indexPath.row == 0 {
            cell.imageArray = [#imageLiteral(resourceName: "handipicked"), #imageLiteral(resourceName: "yellow_dress"), #imageLiteral(resourceName: "handipicked"), #imageLiteral(resourceName: "yellow_dress")]
        }
        else if indexPath.row == 1 {
            cell.imageArray = [#imageLiteral(resourceName: "hand_band"), #imageLiteral(resourceName: "casual_shirts"),#imageLiteral(resourceName: "hand_band"), #imageLiteral(resourceName: "casual_shirts")]
        }
        cell.comingNAV = self.comingNAV
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 225
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 225
    }
    
    
    
    
}
