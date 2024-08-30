//
//  NewPasswordVC.swift
//  YOD
//
//  Created by Mac-As on 30/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class NewPasswordVC: UIViewController {

    
     var navObj = UIViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   @IBAction func btn_BackToProfile(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func btn_BackToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
