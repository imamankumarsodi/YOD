//
//  CancelOrderVC.swift
//  YOD
//
//  Created by Syed Zuber on 29/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class CancelOrderVC: UIViewController {

    
    @IBOutlet weak var tbl_CancelOrder: UITableView!
    
    var reasonArr = ["Incorrect Size Ordered", "Cash Issue", "Ordered By Mistake", "Wants To Change Style? Color"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         tbl_CancelOrder.register(UINib(nibName: "cancelReasonCell", bundle: nil), forCellReuseIdentifier: "cancelReasonCell")
        
        tbl_CancelOrder.delegate = self
        tbl_CancelOrder.dataSource = self
        tbl_CancelOrder.tableFooterView = UIView()
        tbl_CancelOrder.isScrollEnabled = false
    }
    
    
    
    
    @IBAction func btn_GoToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btn_Confirm(_ sender: Any) {
        
        _ = SweetAlert().showAlert("YOD", subTitle: "Your cancellation request has been initiated", style: .success, buttonTitle: "OK", action: { (OK) in
             self.navigationController?.popViewController(animated: true)
        })
       
    }


}

extension CancelOrderVC :UITableViewDelegate,UITableViewDataSource{
    
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reasonArr.count
    }
    
    
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tbl_CancelOrder.dequeueReusableCell(withIdentifier: "cancelReasonCell", for: indexPath) as! cancelReasonCell

        cell.lbl_CancelReason.text = reasonArr[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
