//
//  SortScreenVC.swift
//  YOD
//
//  Created by abc on 09/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SortScreenVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var tblSort: UITableView!
    //MARK: - VARIABLES
    let titleArray = ["WHAT'S NEW","POPULARITY","DISCOUNT","PRICE - LOW TO HIGH","PRICE - HIGH TO LOW","DELIVERY TIME"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
//MARK: - Custom methods extension
extension SortScreenVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblSort.tableFooterView = UIView()
        tblSort.reloadData()
    }
}
//MARK: - TableView dataSource and delegates extension
extension SortScreenVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblSort.register(UINib(nibName: "DeliveryAddressTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "DeliveryAddressTableViewCellAndXib")
        let cell = tblSort.dequeueReusableCell(withIdentifier: "DeliveryAddressTableViewCellAndXib", for: indexPath) as! DeliveryAddressTableViewCellAndXib
        cell.lblTitle.attributedText = NSAttributedString(string: "\(titleArray[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
