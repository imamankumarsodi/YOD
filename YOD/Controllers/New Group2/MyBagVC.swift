//
//  MyBagVC.swift
//  YOD
//
//  Created by abc on 04/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyBagVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblMyBag: UITableView!
   
    //MARK: - VARIABLES
    var footerView:MyBagTableViewFotter = Bundle.main.loadNibNamed("MyBagTableViewFotter", owner: self, options: nil)!.last! as! MyBagTableViewFotter
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnHeaderTapped(_ sender: UIButton) {
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func btn_ProceedTapped(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeliveryAddressVC") as! DeliveryAddressVC
        self.navigationController?.pushViewController(vc, animated: true)

        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


//MARK: - Custom methods extension
extension MyBagVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblMyBag.tableFooterView = footerView
        tblMyBag.reloadData()
        
        footerView.btn_Proceed.addTarget(self, action: #selector(btn_ProceedTapped), for: .touchUpInside)
    }
    
    func updateTableViewTitleUpdate(_ title:String,_ subTitle:String,_ price:String,_ strikePrice:String,_ discountPercents:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        let myMutableString1 = NSMutableAttributedString(string: "\(title)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        myMutableString1.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString1.length))
        
        let myMutableString2 = NSAttributedString(string: "\(subTitle)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :UIColor.lightGray])
        let myMutableString3 = NSAttributedString(string: "Rs\(price)  ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        let myMutableString4 = NSAttributedString(string: "Rs\(strikePrice)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :UIColor.darkGray, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.lightGray])
//        let myMutableString5 = NSAttributedString(string: "  (\(discountPercents)%OFF)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)])
        let myMutableString5 = NSAttributedString(string: "  (\(discountPercents)%OFF)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 15.0)!, .foregroundColor :UIColor.red])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        myMutableString.append(myMutableString4)
        myMutableString.append(myMutableString5)
        return myMutableString
    }
    
}
//MARK: - TableView dataSource and delegates extension
extension MyBagVC:UITableViewDelegate,UITableViewDataSource{
    
    //TODO: Number of Sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else {
            return 2
        }
        
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            tblMyBag.register(UINib(nibName: "MyShoppingBagTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyShoppingBagTableViewCellAndXib")
            let cell = tblMyBag.dequeueReusableCell(withIdentifier: "MyShoppingBagTableViewCellAndXib", for: indexPath) as! MyShoppingBagTableViewCellAndXib
            cell.lblDetails.attributedText = updateTableViewTitleUpdate("Hangup","Men Brown Printed Blazer","1619","5999","73")
            cell.lblSoldBy.text = "Sold by: Jack Shukla"
            
             return cell
        }
        else {
            tblMyBag.register(UINib(nibName: "OptionsMyBagCell", bundle: nil), forCellReuseIdentifier: "OptionsMyBagCell")
            let cell = tblMyBag.dequeueReusableCell(withIdentifier: "OptionsMyBagCell", for: indexPath) as! OptionsMyBagCell
            
            if indexPath.row == 0 {
                cell.lbl_Option.isHidden = false
                cell.btn_Coupon.setTitle("  Apply Coupon", for: .normal)
                cell.btn_Coupon.setImage(#imageLiteral(resourceName: "promotion_ggg"), for: .normal)
                cell.optionViewHeight.constant = 20
            }
            else {
                cell.lbl_Option.isHidden = true
                cell.btn_Coupon.setTitle("  Gift Wrap", for: .normal)
                cell.btn_Coupon.setImage(#imageLiteral(resourceName: "gift"), for: .normal)
                cell.optionViewHeight.constant = 0
            }
            
            
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
