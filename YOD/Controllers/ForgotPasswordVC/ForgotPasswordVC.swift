//
//  ForgotPasswordVC.swift
//  YOD
//
//  Created by Mac-As on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var lbl_Header: UILabel!
    
    var navObj = UIViewController()
    
    var isComingFrom = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isComingFrom == "Forgot" {
            lbl_Header.text = "We need your registered phone number to send password reset information"
        }
        else {
            lbl_Header.text = "We need your registered phone number to send OTP"
        }
        
        
    }
    
    @IBAction func btn_BackToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn_Submit(_ sender: Any) {

        if isComingFrom == "Forgot" {
            self.dismiss(animated: true) {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SendOTPVC") as! SendOTPVC
                vc.navObj = self.navObj
                vc.isComingFrom = "Forgot"
                self.navObj.navigationController?.present(vc, animated: true, completion: nil)
            }
        }
        else {
            
        self.dismiss(animated: true) {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SendOTPVC") as! SendOTPVC
            vc.navObj = self.navObj
            vc.isComingFrom = "LoginViaOTP"
            self.navObj.navigationController?.present(vc, animated: true, completion: nil)
        
            }
        }
        
        
    }
    
}
