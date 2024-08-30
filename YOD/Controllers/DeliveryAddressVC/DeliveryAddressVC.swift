//
//  DeliveryAddressVC.swift
//  YOD
//
//  Created by abc on 05/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class DeliveryAddressVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblDeliveryAddress: UITableView!
    
    //MARK: - VARIABLES
    var footerView:DeliveryAddressFooterView = Bundle.main.loadNibNamed("DeliveryAddressFooterView", owner: self, options: nil)!.last! as! DeliveryAddressFooterView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_ContinueTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentSecVC") as! PaymentSecVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func btnAddnewAddressTapped(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    @objc func btnEditAddressExchange(sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditMyAddressVC") as! EditMyAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Custom methods extension
extension DeliveryAddressVC{
    //TODO: Method initialSetup
    func initialSetup(){
        footerView.btnAddNewAddress.addTarget(self, action: #selector(btnAddnewAddressTapped), for: .touchUpInside)
        footerView.btnEditOrExchangeAddress.addTarget(self, action: #selector(btnEditAddressExchange), for: .touchUpInside)
        tblDeliveryAddress.tableFooterView = footerView
        tblDeliveryAddress.reloadData()
    }
    func updateTableText(_ name:String,_ address:String,_ mobileNumber:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSMutableAttributedString(string: "Name: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        let myMutableString2 = NSMutableAttributedString(string: "\(name)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        let myMutableString3 = NSMutableAttributedString(string: "Address: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString4 = NSMutableAttributedString(string: "\(address)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString5 = NSMutableAttributedString(string: "Mobile Number: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString6 = NSMutableAttributedString(string: "\(mobileNumber)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        myMutableString.append(myMutableString4)
        myMutableString.append(myMutableString5)
        myMutableString.append(myMutableString6)
        
        return myMutableString
    }
   
    
}


//MARK: - TableView dataSource and delegates extension
extension DeliveryAddressVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblDeliveryAddress.register(UINib(nibName: "DeliveryAddressTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "DeliveryAddressTableViewCellAndXib")
        let cell = tblDeliveryAddress.dequeueReusableCell(withIdentifier: "DeliveryAddressTableViewCellAndXib", for: indexPath) as! DeliveryAddressTableViewCellAndXib
        cell.lblTitle.attributedText = updateTableText("Jack Shukla", "Cupertino, California, United States", "Mobile Number")
        return cell
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
