//
//  MyProfileScreenVC.swift
//  YOD
//
//  Created by abc on 05/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyProfileScreenVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblMyProfileScreen: UITableView!
    //MARK: - VARIABLES
    var headerView:MyProfileTableViewHeader = Bundle.main.loadNibNamed("MyProfileTableViewHeader", owner: self, options: nil)!.first! as! MyProfileTableViewHeader
    var footerView:MyProfileTableFooterView = Bundle.main.loadNibNamed("MyProfileTableFooterView", owner: self, options: nil)!.first! as! MyProfileTableFooterView
    let imageArray = [#imageLiteral(resourceName: "box_icon7"),#imageLiteral(resourceName: "saved_98"),#imageLiteral(resourceName: "location_map4"),#imageLiteral(resourceName: "resume_icon3"),#imageLiteral(resourceName: "bell_icon5"),#imageLiteral(resourceName: "user_icon3"),#imageLiteral(resourceName: "coupon"),#imageLiteral(resourceName: "credit-card_(1)"),#imageLiteral(resourceName: "settings"),#imageLiteral(resourceName: "invite_icon")]
    let titleArray = ["My Orders","Wishlist","Address","Profile Details","Notification","Help Center", "Coupon", "Saved Cards", "Settings", "Refer & Earn"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
}

//MARK: - Custom methods extension
extension MyProfileScreenVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblMyProfileScreen.backgroundView = nil
        tblMyProfileScreen.backgroundColor = UIColor.white
        tblMyProfileScreen.reloadData()
    }
    
}


//MARK: - TableView dataSource and delegates extension
extension MyProfileScreenVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblMyProfileScreen.register(UINib(nibName: "MyAccountTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCellAndXib")
        let cell = tblMyProfileScreen.dequeueReusableCell(withIdentifier: "MyAccountTableViewCellAndXib", for: indexPath) as! MyAccountTableViewCellAndXib
        cell.lblTitle.text = titleArray[indexPath.row]
        cell.imgView.image = imageArray[indexPath.row]
//        if indexPath.row == 8{
//            tblMyProfileScreen.separatorStyle = .none
//        }
        return cell
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyOrdersScreenVC") as! MyOrdersScreenVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyAddressVC") as! MyAddressVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 3{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 4{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 5{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HelpCenterVC") as! HelpCenterVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if indexPath.row == 6{
            print("SEND TO COUPON SCREEN")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CouponsVC") as! CouponsVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 7{
            print("SEND TO SAVED CARDS")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SavedCardsVC") as! SavedCardsVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if indexPath.row == 8{
            print("SEND TO COUPON SETTINGS")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingScreenVC") as! SettingScreenVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 9 {
            print("SEND TO REFER AND EARN")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Refer_EarnVC") as! Refer_EarnVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 270
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 70
    }
}
