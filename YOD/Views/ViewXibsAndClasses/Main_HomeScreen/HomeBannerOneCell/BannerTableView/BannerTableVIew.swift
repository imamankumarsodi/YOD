//
//  BannerTableVIew.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class BannerTableVIew: UITableViewCell {

    @IBOutlet weak var bannerTableView: UITableView!
    
    var imageName = String()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "Banner_HomeCell", bundle: nil)
        bannerTableView.register(nib, forCellReuseIdentifier: "Banner_HomeCell")
        
        bannerTableView.delegate = self
        bannerTableView.dataSource = self
        
        bannerTableView.isScrollEnabled = false   //Disable Scrolling.
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BannerTableVIew: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = bannerTableView.dequeueReusableCell(withIdentifier: "Banner_HomeCell", for: indexPath) as! Banner_HomeCell
        cell.img_Banner.image = UIImage(named: imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let vc = storyBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
//        let navigationController = UINavigationController(nibName: "ProductListingVC", bundle: nil)
//        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
}
