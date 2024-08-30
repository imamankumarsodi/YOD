//
//  FilterVC.swift
//  YOD
//
//  Created by abc on 09/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var tblParent: UITableView!
    @IBOutlet weak var tblChild: UITableView!
    
    var selectedRow = Int()
    
    //MARK: - VARIABLES
    let parnetTitleArray = ["Size","Color","Brand","Fabric"]
    let childTitleArray = ["S","M","L","XL","XXL"]
    let tickImageArray = [#imageLiteral(resourceName: "tick_copy_NEW"), #imageLiteral(resourceName: "tick_copy_NEW"), #imageLiteral(resourceName: "tick_copy"),#imageLiteral(resourceName: "tick_copy"),#imageLiteral(resourceName: "tick_copy")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }

    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnBackTapped(_ sender: UIButton) {
        if sender.tag == 1 || sender.tag == 3{
            self.dismiss(animated: true, completion: {
                print("Filter karna hai")
            })
        }else{
            self.dismiss(animated: true, completion: {
                print("Filter clear karna hai")
            })
        }
    }

}

//MARK: - Custom methods extension
extension FilterVC{
    //TODO: Method initialSetup
    func initialSetup(){
        tblParent.tableFooterView = UIView()
        tblParent.reloadData()
        tblChild.tableFooterView = UIView()
        tblChild.reloadData()
    }
}

//MARK: - TableView dataSource and delegates extension
extension FilterVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblParent{
            return parnetTitleArray.count
        }else{
            return childTitleArray.count
        }
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblParent{
            tblParent.register(UINib(nibName: "MyAccountTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCellAndXib")
            let cell = tblParent.dequeueReusableCell(withIdentifier: "MyAccountTableViewCellAndXib", for: indexPath) as! MyAccountTableViewCellAndXib
            cell.lblTitle.attributedText = NSAttributedString(string: "\(parnetTitleArray[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :UIColor.black])
            cell.imgView.isHidden = true
            cell.imageWidthConstraint.constant = 0
            cell.imageTrailingNSLayoutConstraints.constant = 0
            if indexPath.row == 0{
                cell.backgroundColor = UIColor.white
                cell.lblTitle.textColor = UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)
            }else{
                 cell.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
                cell.lblTitle.textColor = UIColor.black
                
            }
            return cell
        }else{
            
            
//            if self.selectedRow == 0 {
                tblChild.register(UINib(nibName: "MyAccountTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCellAndXib")
                let cell = tblChild.dequeueReusableCell(withIdentifier: "MyAccountTableViewCellAndXib", for: indexPath) as! MyAccountTableViewCellAndXib
                cell.lblTitle.attributedText = NSAttributedString(string: "\(childTitleArray[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :UIColor.black])
                cell.imgView.isHidden = false
                cell.imgView.image = tickImageArray[indexPath.row]
                cell.imageWidthConstraint.constant = 20
                cell.imageTrailingNSLayoutConstraints.constant = 20
                if indexPath.row == 0||indexPath.row == 1{
                    cell.lblTitle.textColor = UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)
                }else{
                    cell.lblTitle.textColor = UIColor.black
                    
                }
                
                return cell
//            }
//            else if selectedRow == 1 {
//                tblChild.register(UINib(nibName: "ColourCell", bundle: nil), forCellReuseIdentifier: "ColourCell")
//                let cell = tblChild.dequeueReusableCell(withIdentifier: "ColourCell", for: indexPath) as! ColourCell
//                return cell
//            }
            
//            return UITableViewCell()
//            tblChild.register(UINib(nibName: "MyAccountTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "MyAccountTableViewCellAndXib")
//            let cell = tblChild.dequeueReusableCell(withIdentifier: "MyAccountTableViewCellAndXib", for: indexPath) as! MyAccountTableViewCellAndXib
//            cell.lblTitle.attributedText = NSAttributedString(string: "\(childTitleArray[indexPath.row])", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :UIColor.black])
//            cell.imgView.isHidden = false
//            cell.imgView.image = tickImageArray[indexPath.row]
//            cell.imageWidthConstraint.constant = 20
//            cell.imageTrailingNSLayoutConstraints.constant = 20
//            if indexPath.row == 0||indexPath.row == 1{
//                cell.lblTitle.textColor = UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)
//            }else{
//                cell.lblTitle.textColor = UIColor.black
//
//            }
//            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == tblParent{
            print("PARENT TABLE")
            
//            self.selectedRow = indexPath.row
//            self.tblChild.reloadData()
//            if indexPath.row == 1 {
//
//                let cell = tblChild.dequeueReusableCell(withIdentifier: "MyAccountTableViewCellAndXib", for: indexPath) as! MyAccountTableViewCellAndXib
//
//            }
//
//            else if indexPath.row == 2 {
//                let cell = tblChild.dequeueReusableCell(withIdentifier: "ColourCell", for: indexPath) as! ColourCell
//            }
            
        }else{
            print("CHILD TABLE")
        }
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
