//
//  HelpCenterVC.swift
//  YOD
//
//  Created by abc on 09/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class HelpCenterVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var tblPreviousOrder: UITableView!
    @IBOutlet weak var heightTblPrevious: NSLayoutConstraint!
    @IBOutlet weak var tblChoice: UITableView!
    @IBOutlet weak var heightChoice: NSLayoutConstraint!
    @IBOutlet weak var tblOther: UITableView!
    @IBOutlet weak var heightOtherTbl: NSLayoutConstraint!
    //MARK: - VARIABLES
    static var tagForTitle:Int?
    static var title:String?
    let nameArrayForPrevious = ["Lee Jeans","US Polo","US Polo"]
    let imageArray = [#imageLiteral(resourceName: "photo_3"),#imageLiteral(resourceName: "img543"),#imageLiteral(resourceName: "photo_8")]
    let nameArrayForChoice = ["Payment/Refund","Offer, Discounts, Coupons","Manage Your Account","Other"]
    let nameArrayForOther = ["I have an issue with the mobile app","I have a query on return/exchange process","Other"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        self.heightTblPrevious?.constant = tblPreviousOrder.contentSize.height
        self.heightChoice?.constant = tblChoice.contentSize.height
        self.heightOtherTbl?.constant = tblOther.contentSize.height
    }
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnHeaderTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func btn_NeedHelp(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyOrdersScreenVC") as! MyOrdersScreenVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Custom methods extension
extension HelpCenterVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblPreviousOrder.tableFooterView = UIView()
        tblPreviousOrder.reloadData()
        tblChoice.tableFooterView = UIView()
        tblChoice.reloadData()
        tblOther.tableFooterView = UIView()
        tblOther.reloadData()
    }
}


//MARK: - TableView dataSource and delegates extension
extension HelpCenterVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblPreviousOrder{
            return nameArrayForPrevious.count
        }else if tableView == tblChoice{
            return nameArrayForChoice.count
        }else{
           return nameArrayForOther.count
        }
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblPreviousOrder{
            tblPreviousOrder.register(UINib(nibName: "HelpCenterTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "HelpCenterTableViewCellAndXib")
            let cell = tblPreviousOrder.dequeueReusableCell(withIdentifier: "HelpCenterTableViewCellAndXib", for: indexPath) as! HelpCenterTableViewCellAndXib
            cell.lblDetails.attributedText = UpdateUIClass.updateSharedInstance.updateHelpCenterDetailLabel(nameArrayForPrevious[indexPath.row], "Mens Blue Fit Mid-Rise Jeans", "32", "1")
            cell.lblDeliveryDate.attributedText = UpdateUIClass.updateSharedInstance.updateHelpCenterDeliveryStatusLabel("FEB 2, 2019")
            return cell
        }else if tableView == tblChoice{
            tblChoice.register(UINib(nibName: "ProductDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductDetailsTableViewCell")
            let cell = tblChoice.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell", for: indexPath) as! ProductDetailsTableViewCell
            cell.leadingNSLayoutConstraintlblDetail.constant = 50
            cell.lblDetail.attributedText = NSAttributedString(string: "\(nameArrayForChoice[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :UIColor.black])
            return cell
        }else{
            tblOther.register(UINib(nibName: "DeliveryAddressTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "DeliveryAddressTableViewCellAndXib")
            let cell = tblOther.dequeueReusableCell(withIdentifier: "DeliveryAddressTableViewCellAndXib", for: indexPath) as! DeliveryAddressTableViewCellAndXib
            cell.lblTitle.attributedText = NSAttributedString(string: "\(nameArrayForOther[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 14.0)!, .foregroundColor :UIColor.black])
            cell.titleLeadingConstraints.constant = 40
            return cell
        }

    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblChoice
        {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CommonVC") as! CommonVC
            HelpCenterVC.title = nameArrayForChoice[indexPath.row]
            HelpCenterVC.tagForTitle = indexPath.row
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
