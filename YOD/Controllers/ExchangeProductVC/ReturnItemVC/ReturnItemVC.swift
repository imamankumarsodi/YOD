//
//  ReturnItemVC.swift
//  YOD
//
//  Created by Apple on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ReturnItemVC: UIViewController, returnOrderItemProcced {


    //MARK:- Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variable

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "ReturnItemCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ReturnItemCell")
        
    }

    @IBAction func btn_BackToMyOrder(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_NewAddress(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_Proceed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReturnOrderPopUpVC") as! ReturnOrderPopUpVC
        vc.returnOrderDelegate = self
        self.navigationController?.present(vc, animated: true, completion: nil)
    }

    func returnOrderItem(proceedStatus: String) {
        
        if proceedStatus == "Proceed" {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            print("Not Proceed")
        }
        
    }
    
}

extension ReturnItemVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReturnItemCell") as! ReturnItemCell
        
        return cell
        
    }
    
}
