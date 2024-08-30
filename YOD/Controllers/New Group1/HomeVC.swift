//
//  HomeVC.swift
//  YOD
//
//  Created by abc on 22/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var homeCollectionViewHeader: UICollectionView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var pageControllerRef: UIPageControl!
    @IBOutlet weak var tbl_DetailsHome: UITableView!
    
    @IBOutlet weak var scrollView_Home: UIScrollView!
    @IBOutlet weak var loginView_Home: UIView!
    
    //MARK: - Variables
    let nameArrayForHeaderCollectionView = ["MEN","WOMEN","KIDS", "ACCESSORIES", "SPORTS", "SALE"]
    let imageArrayForHeaderCollectionView = [#imageLiteral(resourceName: "image_a"),#imageLiteral(resourceName: "image_b"),#imageLiteral(resourceName: "image_c"), #imageLiteral(resourceName: "red_bag"), #imageLiteral(resourceName: "new_cloths"), #imageLiteral(resourceName: "img_shirt4")]
    let imageArrayFormMainCollectionView = [#imageLiteral(resourceName: "image_dd"),#imageLiteral(resourceName: "image_dd"),#imageLiteral(resourceName: "image_dd"),#imageLiteral(resourceName: "image_dd")]
    //MARK: - View life cycle methods

    var isComingFrom = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
        
        if (isComingFrom == "LoginButton") || (isComingFrom == "FacebookButton") || (isComingFrom == "GoogleButton") || (isComingFrom == "SignUpButton") || (isComingFrom == "Payment") {
            scrollView_Home.isHidden = true
            loginView_Home.isHidden  = true
            tbl_DetailsHome.isHidden = false
        }
        else {
            scrollView_Home.isHidden = false
            loginView_Home.isHidden  = false
            tbl_DetailsHome.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pageControllerRef.customPageControl()
    }
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnHeaderTapped(_ sender: UIButton) {
        if sender.tag == 1{
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    @IBAction func btn_Login(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_SignUp(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func btn_Facebook(_ sender: Any) {
        BaseViewController.sharedBase.sentToHome(isComingFrom: "FacebookButton")
    }
    
    @IBAction func btn_Google(_ sender: Any) {
        BaseViewController.sharedBase.sentToHome(isComingFrom: "GoogleButton")
    }
}


//MARK: - Custom methods extension
extension HomeVC{
    //TODO: Method initialSetup
    func initialSetup(){
       homeCollectionViewHeader.reloadData()
        Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(self.startTimer), userInfo: nil, repeats: true)
    }
  //TODO: Method for timer
    @objc func startTimer(){
        
        if let coll  = mainCollectionView {
            for cell in coll.visibleCells {
                let indexPath: IndexPath? = coll.indexPath(for: cell)
                if ((indexPath?.row)!  < imageArrayFormMainCollectionView.count - 1){
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: (indexPath?.row)! + 1, section: (indexPath?.section)!)
                    
                    coll.scrollToItem(at: indexPath1!, at: .right, animated: true)
                     pageControllerRef.customPageControl()
                }
                else{
                    let indexPath1: IndexPath?
                    indexPath1 = IndexPath.init(row: 0, section: (indexPath?.section)!)
                    coll.scrollToItem(at: indexPath1!, at: .left, animated: true)
                }
                
            }
        }
    }
}

//MARK: - CollectionView dataSource and delegates
extension HomeVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    //TODO: Number of section in collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //TODO: Number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeCollectionViewHeader{
        return nameArrayForHeaderCollectionView.count
        }else{
            return imageArrayFormMainCollectionView.count
        }
    }
    //TODO: Cell for item at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == homeCollectionViewHeader{
        homeCollectionViewHeader?.register(UINib(nibName: "HomeCollectionViewCellAndXib", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCellAndXib")
        let collectionViewItem = homeCollectionViewHeader.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCellAndXib", for: indexPath) as! HomeCollectionViewCellAndXib
        collectionViewItem.imageView.image = imageArrayForHeaderCollectionView[indexPath.row]
        collectionViewItem.lblTitle.text = nameArrayForHeaderCollectionView[indexPath.row]
        return collectionViewItem
        }else{
            mainCollectionView?.register(UINib(nibName: "MainCollectionViewCellAndXib", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCellAndXib")
            let collectionViewItem = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCellAndXib", for: indexPath) as! MainCollectionViewCellAndXib
            collectionViewItem.imageView.image = imageArrayFormMainCollectionView[indexPath.row]
            
         
            
            return collectionViewItem
        }
    }
    
    //TODO: CollectionView flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == homeCollectionViewHeader {
            return CGSize(width: (UIScreen.main.bounds.size.width/3) + 20, height:self.homeCollectionViewHeader.frame.height)
        }
        else {
            return CGSize(width: self.mainCollectionView.frame.width, height:self.mainCollectionView.frame.height)
        }
    }
    //TODO: CollectionView willDisplay
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == mainCollectionView{
            pageControllerRef.currentPage = indexPath.row
        }else{
            print("Do nothing in homeCollectionViewHeader")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            tbl_DetailsHome.register(UINib(nibName: "CategoriesCollectionCell", bundle: nil), forCellReuseIdentifier: "CategoriesCollectionCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "CategoriesCollectionCell", for: indexPath) as! CategoriesCollectionCell
            cell.comingNAV = self
            return cell
        }
        
        if indexPath.row == 1 {
            
            tbl_DetailsHome.register(UINib(nibName: "header_HomeCell", bundle: nil), forCellReuseIdentifier: "header_HomeCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "header_HomeCell", for: indexPath) as! header_HomeCell
            
            return cell
            
        }
        else if indexPath.row == 2 {
            
            tbl_DetailsHome.register(UINib(nibName: "Banner_HomeCell", bundle: nil), forCellReuseIdentifier: "Banner_HomeCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "Banner_HomeCell", for: indexPath) as! Banner_HomeCell
            cell.img_Banner.image = #imageLiteral(resourceName: "banner_yod_styleTwo")
            return cell
            
        }
            
        else if indexPath.row == 3 {
            
            tbl_DetailsHome.register(UINib(nibName: "ShopByCategoryCell", bundle: nil), forCellReuseIdentifier: "ShopByCategoryCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "ShopByCategoryCell", for: indexPath) as! ShopByCategoryCell
            cell.comingNAV = self
            return cell
        }
        else if indexPath.row == 4 {
            
            tbl_DetailsHome.register(UINib(nibName: "HotDealsCell", bundle: nil), forCellReuseIdentifier: "HotDealsCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "HotDealsCell", for: indexPath) as! HotDealsCell
            cell.comingNAV = self
            return cell
        }
            
        else if indexPath.row == 5 {
            
            tbl_DetailsHome.register(UINib(nibName: "flash_saleCell", bundle: nil), forCellReuseIdentifier: "flash_saleCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "flash_saleCell", for: indexPath) as! flash_saleCell
            
            return cell
        }
            
        else if indexPath.row == 6 {
            
            tbl_DetailsHome.register(UINib(nibName: "FlashTableCell", bundle: nil), forCellReuseIdentifier: "FlashTableCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "FlashTableCell", for: indexPath) as! FlashTableCell
            cell.comingNAV = self
            return cell
        }
        else if indexPath.row == 7 {
            
            tbl_DetailsHome.register(UINib(nibName: "StyleFeedTableCell", bundle: nil), forCellReuseIdentifier: "StyleFeedTableCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "StyleFeedTableCell", for: indexPath) as! StyleFeedTableCell
            cell.comingNAV = self
            return cell
        }
        else if indexPath.row == 8 {
            
            
            tbl_DetailsHome.register(UINib(nibName: "Brand_InFocusTableCollection", bundle: nil), forCellReuseIdentifier: "Brand_InFocusTableCollection")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "Brand_InFocusTableCollection", for: indexPath) as! Brand_InFocusTableCollection
            cell.comingNAV = self
            return cell
            
        }
            
        else if indexPath.row == 9 {
            
            tbl_DetailsHome.register(UINib(nibName: "Banner_HomeCell", bundle: nil), forCellReuseIdentifier: "Banner_HomeCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "Banner_HomeCell", for: indexPath) as! Banner_HomeCell
            cell.img_Banner.image = #imageLiteral(resourceName: "fashion'")
            return cell
        }
        else if indexPath.row == 10 {
            
            tbl_DetailsHome.register(UINib(nibName: "dressesTableCell", bundle: nil), forCellReuseIdentifier: "dressesTableCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "dressesTableCell", for: indexPath) as! dressesTableCell
            
            cell.imageArray = [#imageLiteral(resourceName: "branded_cloths"), #imageLiteral(resourceName: "kurta_img"), #imageLiteral(resourceName: "img_shirt2"), #imageLiteral(resourceName: "img_shirt4")]
            cell.comingNAV = self
            return cell
        }
        else if indexPath.row == 11 {
            
            tbl_DetailsHome.register(UINib(nibName: "Banner_HomeCell", bundle: nil), forCellReuseIdentifier: "Banner_HomeCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "Banner_HomeCell", for: indexPath) as! Banner_HomeCell
            cell.img_Banner.image = #imageLiteral(resourceName: "kurta_imgstylish_img_new")
            
            return cell
        }
            
        else if indexPath.row == 12 {
            
            tbl_DetailsHome.register(UINib(nibName: "dressesTableCell", bundle: nil), forCellReuseIdentifier: "dressesTableCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "dressesTableCell", for: indexPath) as! dressesTableCell
            cell.imageArray = [#imageLiteral(resourceName: "yellow_dress"), #imageLiteral(resourceName: "img_shirt3"), #imageLiteral(resourceName: "yellow_dress"), #imageLiteral(resourceName: "img_shirt3")]
            cell.comingNAV = self
            return cell
        }
        else if indexPath.row == 13 {
            
            tbl_DetailsHome.register(UINib(nibName: "HandipickedTable", bundle: nil), forCellReuseIdentifier: "HandipickedTable")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "HandipickedTable", for: indexPath) as! HandipickedTable
            
            cell.comingNAV = self
            return cell
            
        }
        else if indexPath.row == 14 {

            tbl_DetailsHome.register(UINib(nibName: "ShopByThemeTableCell", bundle: nil), forCellReuseIdentifier: "ShopByThemeTableCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "ShopByThemeTableCell", for: indexPath) as! ShopByThemeTableCell
            
            cell.comingNAV = self
            return cell
        }
        else {
            
            tbl_DetailsHome.register(UINib(nibName: "flash_saleCell", bundle: nil), forCellReuseIdentifier: "flash_saleCell")
            
            let cell = tbl_DetailsHome.dequeueReusableCell(withIdentifier: "flash_saleCell", for: indexPath) as! flash_saleCell
            
            return cell
        }
        
    }
    
    //MARK:- DID SELECTED
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 3 {
            return 325
        }
        else if indexPath.row == 0 {
            return 100
        }
        else if indexPath.row == 2 {
            return 120
        }
        else if indexPath.row == 4 {
            return 150
        }
        else if indexPath.row == 6 {
            return 310
        }
        else if indexPath.row == 7 {
            return 280
        }
        else if indexPath.row == 8 {
            return 630
        }
        else if indexPath.row == 10 {
            return 250
        }
        else if indexPath.row == 12 {
            return 250
        }
        else if indexPath.row == 13 {
            return 480
        }
        else if indexPath.row == 14 {
            return 380
        }
        
        else {
            return UITableView.automaticDimension

        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 325
        }
        else if indexPath.row == 4 {
            return 150
        }
        else if indexPath.row == 6 {
            return 310
        }
        else {
            return UITableView.automaticDimension
            
        }
    }
    
    
}


