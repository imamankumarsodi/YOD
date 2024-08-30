//
//  NotificationsVC.swift
//  YOD
//
//  Created by abc on 09/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class NotificationsVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var tblNotifications: UITableView!
    
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
}

//MARK: - Custom methods extension
extension NotificationsVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblNotifications.tableFooterView = UIView()
        tblNotifications.reloadData()
    }
}


//MARK: - TableView dataSource and delegates extension
extension NotificationsVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblNotifications.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        let cell = tblNotifications.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
            cell.lblTitle.attributedText = UpdateUIClass.updateSharedInstance.updateExchangeOrderProductDescriptionLabel2("Your Order is confirmed","Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
        return cell
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
