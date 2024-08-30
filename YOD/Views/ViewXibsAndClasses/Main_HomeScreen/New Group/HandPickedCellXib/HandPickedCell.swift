//
//  HandPickedCell.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class HandPickedCell: UITableViewCell {

    @IBOutlet weak var handPickedCollectionView: UICollectionView!
    
    
    var imageArray = [UIImage]()
    var comingNAV = UIViewController()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "HandPickedCollectionCell", bundle: nil)
        handPickedCollectionView.register(nib, forCellWithReuseIdentifier: "HandPickedCollectionCell")
        
        handPickedCollectionView.delegate = self
        handPickedCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HandPickedCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = handPickedCollectionView.dequeueReusableCell(withReuseIdentifier: "HandPickedCollectionCell", for: indexPath) as! HandPickedCollectionCell
        cell.img_HandPickedItems.image = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = handPickedCollectionView.bounds.width
        let collectionViewHeight = handPickedCollectionView.bounds.height
        return CGSize(width: collectionViewWidth/2, height: collectionViewHeight)
    }
    
    
    
    
    
}
