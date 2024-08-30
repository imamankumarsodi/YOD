//
//  SettingScreenVC.swift
//  YOD
//
//  Created by Mac-As on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SettingScreenVC: UIViewController {

    
    @IBOutlet weak var tbl_Setting: UITableView!
    
    let titleArray = ["Notification", "Change Password"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbl_Setting.register(UINib(nibName: "SettingTableCell", bundle: nil), forCellReuseIdentifier: "SettingTableCell")
        self.tbl_Setting.tableFooterView = UIView()
    }
    

    @IBAction func btn_BackToProfile(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension SettingScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl_Setting.dequeueReusableCell(withIdentifier: "SettingTableCell", for: indexPath) as! SettingTableCell
        
        cell.lbl_title.text = titleArray[indexPath.row]
        
        if indexPath.row == 0 {
            cell.switch_Toggle.isHidden = false
            cell.imgBack.isHidden = true
        }
        else {
            cell.switch_Toggle.isHidden = true
            cell.imgBack.isHidden = false
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if indexPath.row == 1 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
            self.navigationController?.present(vc, animated: true, completion: nil)
            
            
        }
        
    }
    
}
