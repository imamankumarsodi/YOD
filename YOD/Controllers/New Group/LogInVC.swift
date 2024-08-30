//
//  LogInVC.swift
//  YOD
//
//  Created by abc on 21/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var lblSkip: UILabel!
    @IBOutlet weak var btnOrLoginUsingOTPRef: UIButton!
    @IBOutlet weak var btnNewToYODRef: UIButton!
   
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnLoginTapped(_ sender: UIButton) {
        if sender.tag == 1{
            BaseViewController.sharedBase.sentToHome(isComingFrom: "LoginButton")
        }else if sender.tag == 2{
            BaseViewController.sharedBase.sentToHome(isComingFrom: "FacebookButton")
        }else if sender.tag == 3{
            BaseViewController.sharedBase.sentToHome(isComingFrom: "GoogleButton")
        }else if sender.tag == 4{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            print("OTP WALI SCREEN PAR BHEJNA HAI...")
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
            vc.navObj = self
            vc.isComingFrom = "LoginViaOTP"
            self.navigationController?.present(vc, animated: true, completion: nil)
            
            
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SendOTPVC") as! SendOTPVC
//            self.navigationController?.present(vc, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btn_ForgotPassword(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        vc.navObj = self
        vc.isComingFrom = "Forgot"
        self.navigationController?.present(vc, animated: true, completion: nil)
        
    }
    
    
    //TODO: Gestures
    @objc func lblSkipTapped(){
        BaseViewController.sharedBase.sentToHome(isComingFrom: "LoginSkip")
    }
}

//MARK: - Custom methods extension
extension LogInVC{
    //TODO: Method initialSetup
    func initialSetup(){
        setAttributedStrings()
    }
    //TODO: Method initialSetup
    func setAttributedStrings(){
        var simpleString = "Skip"
        var myMutableString = NSAttributedString(string: "\(simpleString)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0), .underlineStyle: NSUnderlineStyle.single.rawValue])
        lblSkip.attributedText = myMutableString
        lblSkip.isUserInteractionEnabled = true // Remember to do this
        let taplblSkip: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(lblSkipTapped))
        lblSkip.addGestureRecognizer(taplblSkip)
        
        
        simpleString = "Log In using OTP"
        myMutableString = NSAttributedString(string: "\(simpleString)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0), .underlineStyle: NSUnderlineStyle.single.rawValue])
        btnOrLoginUsingOTPRef.setAttributedTitle(myMutableString, for: .normal)

        
        let myMutableString1 = NSMutableAttributedString()
        simpleString = "New to YOD?"
        myMutableString = NSAttributedString(string: "\(simpleString) ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        simpleString = "Sign Up Now"
        let myMutableString2 = NSAttributedString(string: "\(simpleString)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)])
        myMutableString1.append(myMutableString)
        myMutableString1.append(myMutableString2)
        btnNewToYODRef.setAttributedTitle(myMutableString1, for: .normal)
    }
   
}
