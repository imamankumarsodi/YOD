//
//  MyOrdersScreenVC.swift
//  YOD
//
//  Created by abc on 08/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyOrdersScreenVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblMyOrders: UITableView!
    
    //MARK: - VARIABLES
    
    
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
    
    
    //TODO: Table View selectors
    @objc func btnReturnTapped(sender: UIButton){
//      let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeliveryAddressVC") as! DeliveryAddressVC
//        self.navigationController?.pushViewController(vc, animated: true)
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReturnOrderVC") as! ReturnOrderVC
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReturnItemVC") as! ReturnItemVC
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    @objc func btnExchangeTapped(sender: UIButton){
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeliveryAddressVC") as! DeliveryAddressVC
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ExchangeProductVC") as! ExchangeProductVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func btnCancelTapped(sender: UIButton){
        print("GO TO CANCEL SCREEN")
        
        let trackVC = self.storyboard?.instantiateViewController(withIdentifier: "CancelOrderVC") as! CancelOrderVC
        
        self.navigationController?.pushViewController(trackVC, animated: true)
    }
    
    @objc func btnTrackTapped(sender: UIButton){
        print("GO TO CANCEL Track")
        
        let trackVC = self.storyboard?.instantiateViewController(withIdentifier: "TrackMyOrderVC") as! TrackMyOrderVC
        self.navigationController?.pushViewController(trackVC, animated: true)
    }
}

//MARK: - Custom methods extension
extension MyOrdersScreenVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblMyOrders.tableFooterView = UIView()
        tblMyOrders.reloadData()
    }
}

//MARK: - TableView dataSource and delegates extension
extension MyOrdersScreenVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tblMyOrders.register(UINib(nibName: "MyOrderTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyOrderTableViewCellAndXib")
        
        
        let cell = tblMyOrders.dequeueReusableCell(withIdentifier: "MyOrderTableViewCellAndXib", for: indexPath) as! MyOrderTableViewCellAndXib
        
        cell.lblOrderId.text = "Order Number: 040404040404888567"
        
        cell.lblDetails.attributedText = UpdateUIClass.updateSharedInstance.updateMyOrderScreenLabel("Lee Jeans", "Mens Blue Fit Mid-Rise Jeans", "32", "1", "Applied", "1560.50", "3000", "Dispatched", "Thursday,21  February 2019","H-146/147 Sec-63 Noida, H Block, Sector 63, Noida, Uttar Pradesh 201307", "50")
        
  
        
        cell.btnReturnRef.addTarget(self, action: #selector(btnReturnTapped), for: .touchUpInside)
        cell.btnReturnRef.tag = indexPath.row
        
        
        
        cell.btnExchangeRef.addTarget(self, action: #selector(btnExchangeTapped), for: .touchUpInside)
        cell.btnExchangeRef.tag = indexPath.row
        
        
        cell.btnCancelOrder.addTarget(self, action: #selector(btnCancelTapped), for: .touchUpInside)
        cell.btnCancelOrder.tag = indexPath.row
        
        
        cell.btnTrackOrder.addTarget(self, action: #selector(btnTrackTapped), for: .touchUpInside)
        cell.btnTrackOrder.tag = indexPath.row
        

        if indexPath.row == 0 {
            cell.btn_retrunExchnageStack.isHidden = true
            cell.btn_CancelTrackStack.isHidden = false
            cell.btnTrackOrder.isHidden = false
            cell.btnCancelOrder.isHidden = false
            cell.btnReturnRef.isHidden = true
            cell.btnExchangeRef.isHidden = true
        }
        else {
            cell.btn_retrunExchnageStack.isHidden = false
            cell.btn_CancelTrackStack.isHidden = true
            cell.btnTrackOrder.isHidden = true
            cell.btnCancelOrder.isHidden = true
            cell.btnReturnRef.isHidden = false
            cell.btnExchangeRef.isHidden = false
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
