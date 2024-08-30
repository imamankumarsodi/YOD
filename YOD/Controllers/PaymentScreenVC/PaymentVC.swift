//
//  PaymentVC.swift
//  YOD
//
//  Created by Apple on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class PaymentVC: UIViewController {

    //MARK:- Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variable
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "PaymentCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PaymentCell")
        
    }
    
    
    @IBAction func btn_Back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Paynow(_ sender: UIButton) {
        
        _ = SweetAlert().showAlert("YOD", subTitle: "Order placed successfully.", style: .success, buttonTitle: "OK", action: { (OK) in
            
            BaseViewController.sharedBase.sentToHome(isComingFrom: "Payment")

        })
    }
    
    @IBAction func btn_NewAddressPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension PaymentVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell") as! PaymentCell
        
        return cell
        
    }
    
}
