//
//  ProductListingVC.swift
//  YOD
//
//  Created by abc on 22/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ProductListingVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var productListCollectionView: UICollectionView!
    
    //MARK: - VARIABLES
    let imageArrayFormMainCollectionView = [#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44"),#imageLiteral(resourceName: "_img54"),#imageLiteral(resourceName: "_img98"),#imageLiteral(resourceName: "_img_77"),#imageLiteral(resourceName: "_img_44")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    

    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnBackTapped(_ sender: UIButton) {
        if sender.tag == 1{
        self.navigationController?.popViewController(animated: true)
        }else if sender.tag == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    @IBAction func bottombtnTapped(_ sender: UIButton) {
        if sender.tag == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SortScreenVC") as! SortScreenVC
            self.navigationController?.present(vc, animated: true, completion: nil)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
            self.navigationController?.present(vc, animated: true, completion: nil)

        }
    }
    

}
//MARK: - Custom methods extension
extension ProductListingVC{
    //TODO: Method initialSetup
    func initialSetup(){
       updateUI()
    }
    //TODO: Update header label
    func updateUI(){
        let myMutableString1 = NSMutableAttributedString()
        var simpleString = "WOMEN\n"
        let myMutableString = NSAttributedString(string: "\(simpleString) ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.black])
        simpleString = "345677 Items"
        let myMutableString2 = NSAttributedString(string: "\(simpleString)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :UIColor.darkGray])
        myMutableString1.append(myMutableString)
        myMutableString1.append(myMutableString2)
        lblHeader.attributedText = myMutableString1
    }
}

//MARK: - CollectionView dataSource and delegates
extension ProductListingVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
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
            productListCollectionView?.register(UINib(nibName: "ProductListingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductListingCollectionViewCell")
            let collectionViewItem = productListCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductListingCollectionViewCell", for: indexPath) as! ProductListingCollectionViewCell
        collectionViewItem.imgContent.image = imageArrayFormMainCollectionView[indexPath.row]
        collectionViewItem.lblPrice.attributedText = UpdateUIClass.updateSharedInstance.updateCollectionViewLabel("2000", "4567", "50")
            return collectionViewItem
       
    }
    //TODO: Did select item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailsVC") as! ProductDetailsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //TODO: CollectionView flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: (UIScreen.main.bounds.size.width/2)-6, height:327)
    }
   
}
