//
//  HotDealsCell.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class HotDealsCell: UITableViewCell {

    @IBOutlet weak var hotDealsCollectionView: UICollectionView!
    
    var comingNAV = UIViewController()
    
    
    var imageArray = [#imageLiteral(resourceName: "fashion_new_"), #imageLiteral(resourceName: "girls_bag_fshn"), #imageLiteral(resourceName: "fashion_new_"), #imageLiteral(resourceName: "girls_bag_fshn")]
    var detailsArray = ["EXTRA 5% ON 2999 CODE: SAVE10 /n EXTRA 5% ON 2999 CODE: SAVE10", "GET FLAT 50% OFF ON YOUR FAVOURITES", "EXTRA 5% ON 2999 CODE: SAVE10 /n EXTRA 5% ON 2999 CODE: SAVE10", "GET FLAT 50% OFF ON YOUR FAVOURITES"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "Home_HotDealsCollectionCell", bundle: nil)
        hotDealsCollectionView.register(nib, forCellWithReuseIdentifier: "Home_HotDealsCollectionCell")
        
        hotDealsCollectionView.delegate = self
        hotDealsCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HotDealsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = hotDealsCollectionView.dequeueReusableCell(withReuseIdentifier: "Home_HotDealsCollectionCell", for: indexPath) as! Home_HotDealsCollectionCell
        
        cell.img_HotDeals.image = imageArray[indexPath.row]
        cell.lbl_DealsDetails.text = detailsArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = hotDealsCollectionView.bounds.width
        let collectionViewHeight = hotDealsCollectionView.bounds.height
        return CGSize(width: collectionViewWidth/2 + 10, height: collectionViewHeight)
    }
    
}
