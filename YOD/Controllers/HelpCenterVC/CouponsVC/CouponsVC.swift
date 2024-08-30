//
//  CouponsVC.swift
//  YOD
//
//  Created by Mac-As on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class CouponsVC: UIViewController {

    @IBOutlet weak var tbl_Coupons: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tbl_Coupons.register(UINib(nibName: "CouponsTableCell", bundle: nil), forCellReuseIdentifier: "CouponsTableCell")
    }
    
    @IBAction func btn_BackToProfile(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }

}

extension CouponsVC: UITableViewDelegate, UITableViewDataSource {
    
    
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tbl_Coupons.dequeueReusableCell(withIdentifier: "CouponsTableCell", for: indexPath) as! CouponsTableCell
        
        cell.lbl_discount.attributedText = UpdateUIClass.updateSharedInstance.updateCouponsLabel("25%", " OFF")
        cell.lbl_discount.textColor = #colorLiteral(red: 0.4431372549, green: 0.1647058824, blue: 0.5490196078, alpha: 1)
        cell.lbl_minimunPurchase.attributedText = UpdateUIClass.updateSharedInstance.updateCouponsLabel2("On minimum purchase of", " Rs 995")
        cell.lbl_code.attributedText = UpdateUIClass.updateSharedInstance.updateCouponsLabel2("Code:", " HOMESPECIAL40")
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
