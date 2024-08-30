//
//  SendOTPVC.swift
//  YOD
//
//  Created by Mac-As on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SendOTPVC: UIViewController {

    
    var navObj = UIViewController()
    
    
    var isComingFrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btn_Submit(_ sender: Any) {
        
        if isComingFrom == "Forgot" {
            self.dismiss(animated: true) {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "NewPasswordVC") as! NewPasswordVC
                self.navObj.navigationController?.present(vc, animated: true, completion: nil)
            }
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
    
    
    
}
