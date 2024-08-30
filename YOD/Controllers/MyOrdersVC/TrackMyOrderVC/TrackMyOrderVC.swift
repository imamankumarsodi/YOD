//
//  TrackMyOrderVC.swift
//  YOD
//
//  Created by Syed Zuber on 28/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class TrackMyOrderVC: UIViewController {

    @IBOutlet weak var tbl_TrackOrder: UITableView!
    
    
    var statusArr = ["Order is collected by provider","Order is out for delivery","Order is arriving","Order is delievered"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btn_BackToProfile(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}


extension TrackMyOrderVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else if section == 1 {
            return 1
        }
        else {
            return 4
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            
                tbl_TrackOrder.register(UINib(nibName: "MyOrderTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyOrderTableViewCellAndXib")
                
                let cell = tbl_TrackOrder.dequeueReusableCell(withIdentifier: "MyOrderTableViewCellAndXib", for: indexPath) as! MyOrderTableViewCellAndXib
            
            cell.lblOrderId.text = "Order Number: 040404040404888567"
            cell.lblDetails.attributedText = UpdateUIClass.updateSharedInstance.updateMyOrderScreenLabel("Lee Jeans", "Mens Blue Fit Mid-Rise Jeans", "32", "1", "Applied", "1560.50", "3000", "Dispatched", "Thursday,21  February 2019","H-146/147 Sec-63 Noida, H Block, Sector 63, Noida, Uttar Pradesh 201307", "50")
//            cell.btnReturnRef.tag = indexPath.row
//            cell.btnReturnRef.addTarget(self, action: #selector(btnReturnTapped), for: .touchUpInside)
//            cell.btnExchangeRef.tag = indexPath.row
//            cell.btnExchangeRef.addTarget(self, action: #selector(btnExchangeTapped), for: .touchUpInside)
            
//            if indexPath.row == 0 {
//                cell.btn_retrunExchnageStack.isHidden = true
//                cell.btn_CancelTrackStack.isHidden = false
//                cell.btnTrackOrder.isHidden = false
//                cell.btnCancelOrder.isHidden = false
//                cell.btnReturnRef.isHidden = true
//                cell.btnExchangeRef.isHidden = true
//            }
//            else {
//                cell.btn_retrunExchnageStack.isHidden = false
//                cell.btn_CancelTrackStack.isHidden = true
//                cell.btnTrackOrder.isHidden = true
//                cell.btnCancelOrder.isHidden = true
//                cell.btnReturnRef.isHidden = false
//                cell.btnExchangeRef.isHidden = false
//            }
//            
            cell.btn_retrunExchnageStack.isHidden = true
            cell.btn_CancelTrackStack.isHidden = true
            cell.btnTrackOrder.isHidden = true
            cell.btnCancelOrder.isHidden = true
            cell.btnReturnRef.isHidden = true
            cell.btnExchangeRef.isHidden = true
                return cell
          
        }
        else if indexPath.section == 1 {
            
            tbl_TrackOrder.register(UINib(nibName: "progressCell", bundle: nil), forCellReuseIdentifier: "progressCell")
            
            let cell = tbl_TrackOrder.dequeueReusableCell(withIdentifier: "progressCell", for: indexPath) as! progressCell
            
            return cell
        }
        else {
            
            tbl_TrackOrder.register(UINib(nibName: "TrackingDateCell", bundle: nil), forCellReuseIdentifier: "TrackingDateCell")
            tbl_TrackOrder.separatorStyle = .none
            let cell = tbl_TrackOrder.dequeueReusableCell(withIdentifier: "TrackingDateCell", for: indexPath) as! TrackingDateCell
            
            cell.lbl_shippingStatus.text = statusArr[indexPath.row]
            
            if indexPath.row == 3 {
                cell.line_view.isHidden = true
                
            }
            return cell
        }
 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
                return UITableView.automaticDimension
        }
        else if indexPath.section == 1 {
            return 80
        }
            
        else {
            return 40
        }
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        else if indexPath.section == 1 {
            return 80
        }
            
        else {
            return 40
        }
        
    }
    
}
