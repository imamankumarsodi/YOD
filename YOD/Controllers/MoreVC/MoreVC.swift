//
//  MoreVC.swift
//  YOD
//
//  Created by abc on 06/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MoreVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblMore: UITableView!
    //MARK: - VARIABLES
    let titleArray = ["FAQs","Contact Us","About Us",/*"Help Center",*/"Terms Of Use"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
}
//MARK: - Custom methods extension
extension MoreVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblMore.tableFooterView = UIView()
        tblMore.reloadData()
    }
}

//MARK: - TableView dataSource and delegates extension
extension MoreVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblMore.register(UINib(nibName: "MyAccountTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCellAndXib")
        let cell = tblMore.dequeueReusableCell(withIdentifier: "MyAccountTableViewCellAndXib", for: indexPath) as! MyAccountTableViewCellAndXib
        cell.imgView.isHidden = true
        cell.imageTrailingNSLayoutConstraints.constant = 0
        cell.lblTitle.text = titleArray[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.row == 3{
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HelpCenterVC") as! HelpCenterVC
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
}
