//
//  Brand_InFocus_ItemCell.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class Brand_InFocus_ItemCell: UITableViewCell {

    @IBOutlet weak var brand_InFocusColletionView: UICollectionView!
    
    var comingNAV = UIViewController()
    
//    var imageArray = [#imageLiteral(resourceName: "new_collections"), #imageLiteral(resourceName: "msnywar_with_text"),#imageLiteral(resourceName: "new_collections"), #imageLiteral(resourceName: "msnywar_with_text")]

    var imageArray = [UIImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "Brand_InFocus", bundle: nil)
        brand_InFocusColletionView.register(nib, forCellWithReuseIdentifier: "Brand_InFocus")
        
        brand_InFocusColletionView.delegate = self
        brand_InFocusColletionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension Brand_InFocus_ItemCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = brand_InFocusColletionView.dequeueReusableCell(withReuseIdentifier: "Brand_InFocus", for: indexPath) as! Brand_InFocus
        cell.img_brandFocus.image = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = brand_InFocusColletionView.bounds.width
        let collectionViewHeight = brand_InFocusColletionView.bounds.height
        return CGSize(width: collectionViewWidth/2, height: collectionViewHeight)
    }
    
    
    
    
    
}
