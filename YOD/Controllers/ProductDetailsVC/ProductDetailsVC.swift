//
//  ProductListVC.swift
//  YOD
//
//  Created by abc on 23/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ProductDetailsVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var pageControllerRef: UIPageControl!
    @IBOutlet weak var lblProductDetails: UILabel!
    @IBOutlet weak var lblBestPrice: UILabel!
    @IBOutlet weak var lblAvailable: UILabel!
    @IBOutlet weak var lblAmxDiscount: UILabel!
    @IBOutlet weak var lblCashBack: UILabel!
    @IBOutlet weak var lblEMIOptions: UILabel!
    @IBOutlet weak var lblReturnsPolicy: UILabel!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var lblProductDetailAndFiting: UILabel!
    @IBOutlet weak var similarViewCollectionView: UICollectionView!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var customerAlsoLikedCollectionView: UICollectionView!
    
    @IBOutlet weak var lblFooter: UILabel!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    @IBOutlet weak var tbl_Offers: UITableView!
    //MARK: - Variables
    let imageArrayFormMainCollectionView = [#imageLiteral(resourceName: "img_latest543"),#imageLiteral(resourceName: "img_latest543"),#imageLiteral(resourceName: "img_latest543"),#imageLiteral(resourceName: "img_latest543"),#imageLiteral(resourceName: "img_latest543")]
    let sizeArray = ["36","39","40","42","46","48"]
    let colorArray = [#colorLiteral(red: 0.8139386773, green: 0.6868701577, blue: 0.09287340194, alpha: 1),#colorLiteral(red: 0.4872524142, green: 0.7709157467, blue: 0.4616471529, alpha: 1),#colorLiteral(red: 0.7020815015, green: 0.04069697112, blue: 0.3631163836, alpha: 1),#colorLiteral(red: 0.1617099941, green: 0.7110761404, blue: 0.7590293884, alpha: 1)]
    let imageArrayFormSimilarCollectionView = [#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4"),#imageLiteral(resourceName: "img_shirt99"),#imageLiteral(resourceName: "img_shirt8"),#imageLiteral(resourceName: "img_shirt4")]
    let textArray = ["More Shirts by US POLO","More Blue Shirts","More Shirts",]
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableHeight?.constant = tblView.contentSize.height
        
    }
    //MARK: - Actions, Gestures
    //TODO: Actions
        @IBAction func btnHeaderTapped(_ sender: UIButton) {
        if sender.tag == 1{
            self.navigationController?.popViewController(animated: true)
        }else if sender.tag == 2{
            print("THERE SHOUD BE SHARE BUTTON ICON")
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
//            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 3{
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
//            self.navigationController?.pushViewController(vc, animated: true)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
//            self.navigationController?.pushViewController(vc, animated: true)
            BaseViewController.sharedBase.sentToBag()
        }
    }
}

//MARK: - Custom methods extension
extension ProductDetailsVC{
    //TODO: Method initialSetup
    func initialSetup(){
        mainCollectionView.reloadData()
        lblProductDetails.attributedText = updateUI("GAP", "Men's Red & White Checked Oxford Plaid Shirt", "2,499", "1900", "30", "Or Buy 1@MRP, get 1 Free*", "Additional tax may apply; charged at checkout")
//        lblBestPrice.attributedText = updateBestPriceLabel("1,400")
//
//        lblAvailable.text = "Applicable on: Order above Rs. 2999,\n\n\nCoupon code: SAVE10\n\n\nMax Discount: 44% of MRP (Your total saving: Rs. 1099)"
//        lblAmxDiscount.attributedText = UpdateUIClass.updateSharedInstance.updateAmxLabel("15% Instant Discount on AmEx Credit Cards", "Min spend Rs. 3,000; Max discount Rs. 1,500")
//        lblCashBack.attributedText = UpdateUIClass.updateSharedInstance.updateAmxLabel("Flat 200 Cashback on PhonePe", "Max SuperCash Rs. 250.TCA")
//        lblEMIOptions.attributedText = UpdateUIClass.updateSharedInstance.updateAmxLabel("EMI option available", "EMI starting from Rs. 100/month")
        lblReturnsPolicy.attributedText = UpdateUIClass.updateSharedInstance.updateAmxLabel("Easy 15 days Return and 15 Days exchange", "Choose to return within 15 days or exchange within 15 days.")
        sizeCollectionView.reloadData()
        colorCollectionView.reloadData()
        let myMutableString = UpdateUIClass.updateSharedInstance.updateAmxLabel("Product Details", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n")
        myMutableString.append(UpdateUIClass.updateSharedInstance.updateAmxLabel("Size & Fit", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n"))
        myMutableString.append(UpdateUIClass.updateSharedInstance.updateAmxLabel("VIEW SIMILAR", ""))
        lblProductDetailAndFiting.attributedText = myMutableString
        similarViewCollectionView.reloadData()
        tblView.reloadData()
        customerAlsoLikedCollectionView.reloadData()
        lblFooter.attributedText = updateFotterLabel("25488845", "Jack Shukla", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.")   // third tab is tax
        
        //Offers TableView
//        tbl_Offers.register(UINib(nibName: "cancelReasonCell", bundle: nil), forCellReuseIdentifier: "cancelReasonCell")
        
        tbl_Offers.delegate = self
        tbl_Offers.dataSource = self
        tbl_Offers.tableFooterView = UIView()
        tbl_Offers.isScrollEnabled = false
    }
    
    //TODO: Product details label update
    func updateUI(_ brand:String,_ productDetails:String,_ price:String,_ strikePrice:String,_ discountPercentage:String,_ offerString:String,_ AdditionalTax:String)->NSMutableAttributedString{
        
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(brand)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString2 = NSAttributedString(string: "\(productDetails)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        
        let myMutableString3 = NSAttributedString(string: "Rs\(price)  ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString4 = NSAttributedString(string: "Rs\(strikePrice)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.darkGray])
        let myMutableString5 = NSAttributedString(string: "  (\(discountPercentage)% OFF)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor(red: 195/255, green: 10/255, blue: 0/255, alpha: 1.0)])
        
        let myMutableString6 = NSAttributedString(string: "\(offerString)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)])
        
        let myMutableString7 = NSAttributedString(string: "\(AdditionalTax)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :UIColor.darkGray])
        
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        myMutableString.append(myMutableString4)
        myMutableString.append(myMutableString5)
        myMutableString.append(myMutableString6)
        myMutableString.append(myMutableString7)
        return myMutableString
    }
    //TODO: Best price  label update
    func updateBestPriceLabel(_ price:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "Best Price: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString2 = NSAttributedString(string: "₹", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor(red: 195/255, green: 10/255, blue: 0/255, alpha: 1.0)])
        
        let myMutableString3 = NSAttributedString(string: "\(price)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor(red: 195/255, green: 10/255, blue: 0/255, alpha: 1.0)])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        return myMutableString
    }
    
    
    //TODO: Footer  label update
    func updateFotterLabel(_ productCode:String,_ soldBy:String,_ tax:String)->NSMutableAttributedString{
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "MORE INFORMATION\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 18.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString2 = NSAttributedString(string: "Product Code: \(productCode)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 18.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString3 = NSAttributedString(string: "Sold by:", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString4 = NSAttributedString(string: " \(soldBy)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)])
        
//        let myMutableString5 = NSAttributedString(string: "Tax: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 14.0)!, .foregroundColor :UIColor.black])
//        let myMutableString6 = NSAttributedString(string: "\(tax)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 14.0)!, .foregroundColor :UIColor.darkGray])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        myMutableString.append(myMutableString4)
//        myMutableString.append(myMutableString5)
//        myMutableString.append(myMutableString6)
        
         myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        return myMutableString
    }
    
}


//MARK: - CollectionView dataSource and delegates
extension ProductDetailsVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    //TODO: Number of section in collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //TODO: Number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainCollectionView{
            return imageArrayFormMainCollectionView.count
        }else if collectionView == sizeCollectionView{
            return sizeArray.count
        }else if collectionView == colorCollectionView{
            return colorArray.count
        }else if collectionView == similarViewCollectionView{
            return imageArrayFormSimilarCollectionView.count
        }else{
            return imageArrayFormSimilarCollectionView.count
        }
    }
    //TODO: Cell for item at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView{
            mainCollectionView?.register(UINib(nibName: "ProductDetailsMainCollectionViewCellAndXib", bundle: nil), forCellWithReuseIdentifier: "ProductDetailsMainCollectionViewCellAndXib")
            let collectionViewItem = mainCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailsMainCollectionViewCellAndXib", for: indexPath) as! ProductDetailsMainCollectionViewCellAndXib
            collectionViewItem.imageView.image = imageArrayFormMainCollectionView[indexPath.row]
            return collectionViewItem
        }else if collectionView == sizeCollectionView{
            sizeCollectionView?.register(UINib(nibName: "SizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SizeCollectionViewCell")
            let collectionViewItem = sizeCollectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionViewCell", for: indexPath) as! SizeCollectionViewCell
            collectionViewItem.lblSize.attributedText = UpdateUIClass.updateSharedInstance.strikeSize(sizeArray[indexPath.row])
            return collectionViewItem
        }else if collectionView == colorCollectionView{
            colorCollectionView?.register(UINib(nibName: "SizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SizeCollectionViewCell")
            let collectionViewItem = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionViewCell", for: indexPath) as! SizeCollectionViewCell
            collectionViewItem.lblSize.backgroundColor = colorArray[indexPath.row]
            collectionViewItem.lblSize.layer.cornerRadius = 15
            return collectionViewItem
        }else if collectionView == similarViewCollectionView{
            similarViewCollectionView?.register(UINib(nibName: "SimilarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimilarCollectionViewCell")
            let collectionViewItem = similarViewCollectionView.dequeueReusableCell(withReuseIdentifier: "SimilarCollectionViewCell", for: indexPath) as! SimilarCollectionViewCell
            collectionViewItem.imgViewContent.image = imageArrayFormSimilarCollectionView[indexPath.row]
            collectionViewItem.lblPrice.attributedText = UpdateUIClass.updateSharedInstance.updateCollectionViewLabelForSimilar("2000", "4567", "50")
            return collectionViewItem
        }else{
            similarViewCollectionView?.register(UINib(nibName: "SimilarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SimilarCollectionViewCell")
            let collectionViewItem = similarViewCollectionView.dequeueReusableCell(withReuseIdentifier: "SimilarCollectionViewCell", for: indexPath) as! SimilarCollectionViewCell
            collectionViewItem.imgViewContent.image = imageArrayFormSimilarCollectionView[indexPath.row]
            collectionViewItem.lblPrice.attributedText = UpdateUIClass.updateSharedInstance.updateCollectionViewLabelForSimilar("2000", "4567", "50")
            return collectionViewItem
        }
    }
    //TODO: CollectionView flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == mainCollectionView {
            return CGSize(width: UIScreen.main.bounds.size.width, height:377)
        }else if collectionView == sizeCollectionView{
            return CGSize(width: 30, height:30)
        }else if collectionView == colorCollectionView{
            return CGSize(width: 30, height:30)
        }else if collectionView == similarViewCollectionView{
            return CGSize(width: 150, height:217)
        }else{
            return CGSize(width: 150, height:217)
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
}

//MARK:- TableView Delegate Functions
//MARK:
extension ProductDetailsVC:UITableViewDelegate,UITableViewDataSource{
    
    //TODO:-TABLEVIEW DELEGATES
    //TODO:
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == tbl_Offers {
            return 2
        }
        else {
            return textArray.count
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tbl_Offers {
            
           tbl_Offers.register(UINib(nibName: "cancelReasonCell", bundle: nil), forCellReuseIdentifier: "cancelReasonCell")
            let cell = tbl_Offers.dequeueReusableCell(withIdentifier: "cancelReasonCell", for: indexPath) as! cancelReasonCell
            cell.lbl_CancelReason.text = "Offers: Lorem Ipsum is simply dummy text of the printing and typesetting industry"
           
            return cell
        }
        else {
            tblView.register(UINib(nibName: "ProductDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductDetailsTableViewCell")
            let cell = tblView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell", for: indexPath) as! ProductDetailsTableViewCell
            cell.lblDetail.text = textArray[indexPath.row]
            return cell
        }
        
        
        
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

