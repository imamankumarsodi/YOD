//
//  MyAddressVC.swift
//  YOD
//
//  Created by abc on 09/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyAddressVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblMyAddress: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    //MARK: - Actions, Gestures
    
    //TODO: Actions
    @IBAction func btnHeaderTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func btnAddNewAddress(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //TODO: TableView Selectors
    @objc func btnEditRefTapped(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditMyAddressVC") as! EditMyAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func btnRemoveRefTapped(sender: UIButton){
        print("Remove Address...")
    }
    
}

//MARK: - Custom methods extension
extension MyAddressVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblMyAddress.tableFooterView = UIView()
        tblMyAddress.reloadData()
    }
    
    func updateTableText(_ name:String,_ address:String,_ mobileNumber:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
//        let myMutableString1 = NSMutableAttributedString(string: "Name: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        let myMutableString2 = NSMutableAttributedString(string: "\(name)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString3 = NSMutableAttributedString(string: "Address: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString4 = NSMutableAttributedString(string: "\(address)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString5 = NSMutableAttributedString(string: "Mobile Number: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString6 = NSMutableAttributedString(string: "\(mobileNumber)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        
//        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        myMutableString.append(myMutableString4)
        myMutableString.append(myMutableString5)
        myMutableString.append(myMutableString6)
        
        return myMutableString
    }
    func updateTableText2(_ name:String,_ address:String,_ mobileNumber:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        
        let myMutableString1 = NSMutableAttributedString(string: "Other Address\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        
//        let myMutableString2 = NSMutableAttributedString(string: "Name: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        let myMutableString3 = NSMutableAttributedString(string: "\(name)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
//        let myMutableString4 = NSMutableAttributedString(string: "Address: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        let myMutableString5 = NSMutableAttributedString(string: "\(address)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString6 = NSMutableAttributedString(string: "Mobile Number: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString7 = NSMutableAttributedString(string: "\(mobileNumber)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        
        myMutableString.append(myMutableString1)
//        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
//        myMutableString.append(myMutableString4)
        myMutableString.append(myMutableString5)
        myMutableString.append(myMutableString6)
        myMutableString.append(myMutableString7)
        
        return myMutableString
    }
}



//MARK: - TableView dataSource and delegates extension
extension MyAddressVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblMyAddress.register(UINib(nibName: "MyAddressTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyAddressTableViewCellAndXib")
        let cell = tblMyAddress.dequeueReusableCell(withIdentifier: "MyAddressTableViewCellAndXib", for: indexPath) as! MyAddressTableViewCellAndXib
        if indexPath.row == 0{
            cell.viewButtons.isHidden = false
            cell.lblTitle.attributedText = updateTableText("Jack Shukla","Noida Sector 63","888888888")
            cell.viewHeight.constant = 45
            cell.btnEditRef.tag = indexPath.row
            cell.btnEditRef.addTarget(self, action: #selector(btnEditRefTapped), for: .touchUpInside)
            cell.btnRemoveRef.tag = indexPath.row
            cell.btnRemoveRef.addTarget(self, action: #selector(btnRemoveRefTapped), for: .touchUpInside)
        }else{
            cell.viewButtons.isHidden = true
            cell.lblTitle.attributedText = updateTableText2("Jack Shukla","Noida Sector 63","888888888")
            cell.viewHeight.constant = 0
            
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
