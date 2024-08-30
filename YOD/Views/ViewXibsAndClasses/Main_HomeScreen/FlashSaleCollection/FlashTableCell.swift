//
//  FlashTableCell.swift
//  YOD
//
//  Created by Mac-As on 23/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class FlashTableCell: UITableViewCell {

    @IBOutlet weak var flashCollectionView: UICollectionView!
    
    var comingNAV = UIViewController()
    
    
    var imageArray =  [#imageLiteral(resourceName: "cloths_icn"), #imageLiteral(resourceName: "women_photo"),#imageLiteral(resourceName: "cloths_icn"), #imageLiteral(resourceName: "selected_icon")]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let nib = UINib(nibName: "FlashSaleCollectionsCell", bundle: nil)
        flashCollectionView.register(nib, forCellWithReuseIdentifier: "FlashSaleCollectionsCell")
        
        flashCollectionView.delegate = self
        flashCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension FlashTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = flashCollectionView.dequeueReusableCell(withReuseIdentifier: "FlashSaleCollectionsCell", for: indexPath) as! FlashSaleCollectionsCell
        cell.img_Product.image = imageArray[indexPath.row]
        cell.lbl_PriceLabel.attributedText =  updateCollectionViewLabel("567", "1789")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = GlobalFunctions.mainStoryBoard.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.comingNAV.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = flashCollectionView.bounds.width
        let collectionViewHeight = flashCollectionView.bounds.height
        return CGSize(width: collectionViewWidth/2, height: collectionViewHeight)
    }
    
    
    //TODO: Update collectionView price label
    func updateCollectionViewLabel(_ price:String,_ strikePrice:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "Rs.\(price)  ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 15.0)!, .foregroundColor :UIColor.red])
        let myMutableString2 = NSAttributedString(string: "Rs.\(strikePrice)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 14.0)!, .foregroundColor :UIColor.darkGray, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.darkGray])
        //        let myMutableString3 = NSAttributedString(string: "  \(discountPercents)%OFF", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 15.0)!, .foregroundColor :UIColor(red: 195/255, green: 10/255, blue: 0/255, alpha: 1.0)])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        //        myMutableString.append(myMutableString3)
        return myMutableString
    }
    
}
