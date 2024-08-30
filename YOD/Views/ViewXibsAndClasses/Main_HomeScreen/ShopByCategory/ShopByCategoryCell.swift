//
//  ShopByCategoryCell.swift
//  YOD
//
//  Created by Mac-As on 22/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ShopByCategoryCell: UITableViewCell {

    @IBOutlet weak var shopByCateCollection: UICollectionView!
    
    
    var comingNAV = UIViewController()
    
    var imageArray = [#imageLiteral(resourceName: "women_fshn"), #imageLiteral(resourceName: "mens_style"), #imageLiteral(resourceName: "cute_kids") , #imageLiteral(resourceName: "women_fshn"), #imageLiteral(resourceName: "mens_style")]
    var btnOneArray = ["KURTA & KUTRIS", "T-SHIRT", "DRESSES & SKIRTS", "KURTA & KUTRIS", "T-SHIRT"]
    var btnTwoArray = ["TOP & TEES", "CASUAL SHIRTS", "T-SHIRT & POLOS", "TOP & TEES", "CASUAL SHIRTS"]
    var btnThreeArray = ["DRESSES", "JEANS", "TOPS & TUNIC", "DRESSES", "JEANS"]
    var btnFourArray = ["SHOES", "SHORT SHOES", "SHIRTS", "SHOES", "SHORT SHOES"]
    var btnFiveArray = ["WATCHES", "SNEAKERS", "JEANS & TROUSERS","WATCHES", "SNEAKERS"]
    var btnSixArray = ["HANDBAGS", "CASUAL SHOES", "ETHNIC WEAR", "HANDBAGS", "CASUAL SHOES"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "HomeShopCategoryCell", bundle: nil)
        shopByCateCollection.register(nib, forCellWithReuseIdentifier: "HomeShopCategoryCell")
        
        shopByCateCollection.delegate = self
        shopByCateCollection.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension ShopByCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = shopByCateCollection.dequeueReusableCell(withReuseIdentifier: "HomeShopCategoryCell", for: indexPath) as! HomeShopCategoryCell
        
        cell.img_Items.image = imageArray[indexPath.row]
        cell.btn_cloth_TypeOne.setTitle(btnOneArray[indexPath.row], for: .normal)
        cell.btn_cloth_TypeTwo.setTitle(btnTwoArray[indexPath.row], for: .normal)
        cell.btn_cloth_TypeThree.setTitle(btnThreeArray[indexPath.row], for: .normal)
        cell.btn_cloth_TypeFour.setTitle(btnFourArray[indexPath.row], for: .normal)
        cell.btn_cloth_TypeFive.setTitle(btnFiveArray[indexPath.row], for: .normal)
        cell.btn_cloth_TypeSix.setTitle(btnSixArray[indexPath.row], for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = shopByCateCollection.bounds.width
        let collectionViewHeight = shopByCateCollection.bounds.height
        return CGSize(width: collectionViewWidth/3, height: collectionViewHeight)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DID SELECT OF COLLECTION VIEW SHOP BY CATEGORY")
        
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)

    }
    
}
