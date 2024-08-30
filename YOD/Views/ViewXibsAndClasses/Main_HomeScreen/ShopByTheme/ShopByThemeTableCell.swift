//
//  ShopByThemeTableCell.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ShopByThemeTableCell: UITableViewCell {

    @IBOutlet weak var shopByThemeCollectionView: UICollectionView!
    
    var imageArray = [#imageLiteral(resourceName: "theam_cloths"), #imageLiteral(resourceName: "kurta_img"), #imageLiteral(resourceName: "_img_77"), #imageLiteral(resourceName: "kurta_img")]
    var comingNAV = UIViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "ShopByTheme", bundle: nil)
        shopByThemeCollectionView.register(nib, forCellWithReuseIdentifier: "ShopByTheme")
        
        shopByThemeCollectionView.delegate = self
        shopByThemeCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ShopByThemeTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = shopByThemeCollectionView.dequeueReusableCell(withReuseIdentifier: "ShopByTheme", for: indexPath) as! ShopByTheme
        cell.img_ShopByTheme.image = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
//        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
        
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ShopByThemeVC") as! ShopByThemeVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = shopByThemeCollectionView.bounds.width
        let collectionViewHeight = shopByThemeCollectionView.bounds.height
        return CGSize(width: collectionViewWidth/2, height: collectionViewHeight)
    }
    
}
