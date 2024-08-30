//
//  MyWistListVC.swift
//  YOD
//
//  Created by abc on 02/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyWistListVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var myWishListCollectionView: UICollectionView!
    //MARK: - VARIABLES
    let imageArrayFormMainCollectionView = [#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnHeaderTapped(_ sender: UIButton) {
        if sender.tag == 1{ self.navigationController?.popViewController(animated: true)
        }else{
           BaseViewController.sharedBase.sentToBag()
        }
    }
}


//MARK: - Custom methods extension
extension MyWistListVC{
    //TODO: Method initialSetup
    func initialSetup(){
        updateUI()
    }
    //TODO: Update header label
    func updateUI(){
        let myMutableString1 = NSMutableAttributedString()
        var simpleString = "WISHLIST\n"
        var myMutableString = NSAttributedString(string: "\(simpleString) ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.black])
        simpleString = "7 Items"
        let myMutableString2 = NSAttributedString(string: "\(simpleString)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 14.0)!, .foregroundColor :UIColor.darkGray])
        myMutableString1.append(myMutableString)
        myMutableString1.append(myMutableString2)
        lblHeader.attributedText = myMutableString1
    }
}

//MARK: - CollectionView dataSource and delegates
extension MyWistListVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    //TODO: Number of section in collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //TODO: Number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArrayFormMainCollectionView.count
        
    }
    //TODO: Cell for item at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        myWishListCollectionView?.register(UINib(nibName: "MyWishListCollectionViewCellAndXib", bundle: nil), forCellWithReuseIdentifier: "MyWishListCollectionViewCellAndXib")
        let collectionViewItem = myWishListCollectionView.dequeueReusableCell(withReuseIdentifier: "MyWishListCollectionViewCellAndXib", for: indexPath) as! MyWishListCollectionViewCellAndXib
        collectionViewItem.imgContent.image = imageArrayFormMainCollectionView[indexPath.row]
        collectionViewItem.lblPrice.attributedText = UpdateUIClass.updateSharedInstance.updateCollectionViewLabel("2000", "4567", "50")
        return collectionViewItem
        
    }
    //TODO: CollectionView flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width/2)-6, height:361)
    }
    
}
