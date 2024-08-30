//
//  dressesTableCell.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class dressesTableCell: UITableViewCell {

    @IBOutlet weak var dressCollectionView: UICollectionView!
    
    var comingNAV = UIViewController()
    
//    var imageArray = [#imageLiteral(resourceName: "men_vest"), #imageLiteral(resourceName: "new_cloths"), #imageLiteral(resourceName: "men_vest"), #imageLiteral(resourceName: "new_cloths")]
    var imageArray = [UIImage]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "dressesCollectionCell", bundle: nil)
        dressCollectionView.register(nib, forCellWithReuseIdentifier: "dressesCollectionCell")
        
        dressCollectionView.delegate = self
        dressCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension dressesTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = dressCollectionView.dequeueReusableCell(withReuseIdentifier: "dressesCollectionCell", for: indexPath) as! dressesCollectionCell
        cell.img_Items.image = imageArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = dressCollectionView.bounds.width
        let collectionViewHeight = dressCollectionView.bounds.height
        return CGSize(width: collectionViewWidth/2, height: collectionViewHeight)
    }
    
   
}
