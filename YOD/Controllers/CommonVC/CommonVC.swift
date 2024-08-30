//
//  CommonVC.swift
//  YOD
//
//  Created by abc on 09/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class CommonVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblCommon: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBAction func btnBack(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - VARIABLES
    
    let arrPayment = ["My return was picked up but i haven't received my refund yet.","My payment has been debited multiple times.", "My bank account details for refund.","I am unable to pay using wallet.",/*"I am self shipped my return my return but haven't received my refund yet","My order didn't get placed, but payment got debited"*/]
    
    let arrManageYourAccount = ["I am unable to login my account","I wnat to unsubscribe from promotional emails and SMS","Somethig is wrong with my wishlist","I have an issue with my referral points."]
    
    let arrOffersAndDiscounts = ["My coupon got locked","I am unable to apply coupon","I did not receive instant Cashback(Credit/DebitCard)","I am unable to pay using Wallet","I did not receive complete discount","Other"]
    
    let arrOthers = ["I have an issue with the mobile app","I have a query on return/exchange process","Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = HelpCenterVC.title
        print("tag is", HelpCenterVC.tagForTitle)

        // Do any additional setup after loading the view.
        initialSetup()
    }

}
//MARK: - Custom methods extension
extension CommonVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblCommon.tableFooterView = UIView()
        tblCommon.reloadData()
    }
}

//MARK: - TableView dataSource and delegates extension
extension CommonVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if HelpCenterVC.tagForTitle == 0{
            count = arrPayment.count
        }
        else if HelpCenterVC.tagForTitle == 1{
           count = arrOffersAndDiscounts.count
        }
        else if HelpCenterVC.tagForTitle == 2{
            count = arrManageYourAccount.count
        }
        else if HelpCenterVC.tagForTitle == 3{
            count = arrOthers.count
        }
        return count ?? 0
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblCommon.register(UINib(nibName: "ProductDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductDetailsTableViewCell")
        let cell = tblCommon.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell", for: indexPath) as! ProductDetailsTableViewCell
        if HelpCenterVC.tagForTitle == 0{
             cell.lblDetail.attributedText = NSAttributedString(string: "\(arrPayment[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        }
        else if HelpCenterVC.tagForTitle == 1{
            cell.lblDetail.attributedText = NSAttributedString(string: "\(arrOffersAndDiscounts[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        }
        else if HelpCenterVC.tagForTitle == 2{
            cell.lblDetail.attributedText = NSAttributedString(string: "\(arrManageYourAccount[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        }
        else if HelpCenterVC.tagForTitle == 3{
            cell.lblDetail.attributedText = NSAttributedString(string: "\(arrOthers[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        }
        return cell
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
