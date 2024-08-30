//
//  CategoriesCollectionCell.swift
//  YOD
//
//  Created by Mac-As on 03/06/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class CategoriesCollectionCell: UITableViewCell {

    @IBOutlet weak var categoryCollection: UICollectionView!
    var comingNAV = UIViewController()
    
    
    let imageArrayForHeaderCollectionView = [#imageLiteral(resourceName: "image_a"),#imageLiteral(resourceName: "image_b"),#imageLiteral(resourceName: "image_c"), #imageLiteral(resourceName: "red_bag"), #imageLiteral(resourceName: "new_cloths"), #imageLiteral(resourceName: "img_shirt4")]
    let nameArrayForHeaderCollectionView = ["MEN","WOMEN","KIDS", "ACCESSORIES", "SPORTS", "SALE"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code.
        categoryCollection?.register(UINib(nibName: "HomeCollectionViewCellAndXib", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCellAndXib")
        
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CategoriesCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //TODO: Number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 6
    }
    //TODO: Cell for item at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let collectionViewItem = categoryCollection.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCellAndXib", for: indexPath) as! HomeCollectionViewCellAndXib
            collectionViewItem.imageView.image = imageArrayForHeaderCollectionView[indexPath.row]
            collectionViewItem.lblTitle.text = nameArrayForHeaderCollectionView[indexPath.row]
            return collectionViewItem
      
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    //TODO: CollectionView flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = categoryCollection.bounds.width
        let collectionViewHeight = categoryCollection.bounds.height
        return CGSize(width: collectionViewWidth/3 + 20, height: collectionViewHeight)
        
    }

    
    
    
}
