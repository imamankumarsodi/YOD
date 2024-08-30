//
//  Brand_InFocusTableCollection.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class Brand_InFocusTableCollection: UITableViewCell {

    @IBOutlet weak var brand_InfocusTableView: UITableView!
    var comingNAV = UIViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "Brand_InFocus_ItemCell", bundle: nil)
        brand_InfocusTableView.register(nib, forCellReuseIdentifier: "Brand_InFocus_ItemCell")
        
        brand_InfocusTableView.delegate = self
        brand_InfocusTableView.dataSource = self
        
        brand_InfocusTableView.isScrollEnabled = false   //Disable scrolling
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension Brand_InFocusTableCollection: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = brand_InfocusTableView.dequeueReusableCell(withIdentifier: "Brand_InFocus_ItemCell", for: indexPath) as! Brand_InFocus_ItemCell
        
        if indexPath.row == 0 {
            
            cell.imageArray = [#imageLiteral(resourceName: "proffesional_men"), #imageLiteral(resourceName: "virat_manywar"),#imageLiteral(resourceName: "proffesional_men"), #imageLiteral(resourceName: "virat_manywar")]
        }
        else if indexPath.row == 1 {
            cell.imageArray = [#imageLiteral(resourceName: "virat_manywar"), #imageLiteral(resourceName: "proffesional_men"), #imageLiteral(resourceName: "virat_manywar"), #imageLiteral(resourceName: "proffesional_men")]
        }
        cell.comingNAV = self.comingNAV
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
    
}
