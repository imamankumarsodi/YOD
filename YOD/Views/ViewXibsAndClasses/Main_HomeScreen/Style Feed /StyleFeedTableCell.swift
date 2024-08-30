//
//  StyleFeedTableCell.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class StyleFeedTableCell: UITableViewCell {

    @IBOutlet weak var styleFeedCollectionView: UICollectionView!
    
    var comingNAV = UIViewController()
    
    
    var imageArray = [#imageLiteral(resourceName: "fashin_skin_care"), #imageLiteral(resourceName: "t_shirts_fshn"), #imageLiteral(resourceName: "skin_care_img"), #imageLiteral(resourceName: "women_fshn")]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "StyleFeedCollection", bundle: nil)
        styleFeedCollectionView.register(nib, forCellWithReuseIdentifier: "StyleFeedCollection")
        
        styleFeedCollectionView.delegate = self
        styleFeedCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension StyleFeedTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = styleFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "StyleFeedCollection", for: indexPath) as! StyleFeedCollection
        cell.img_styleFeed.image = imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = styleFeedCollectionView.bounds.width
        let collectionViewHeight = styleFeedCollectionView.bounds.height
        return CGSize(width: collectionViewWidth/2, height: collectionViewHeight)
    }
    
    
    
    
    
}
