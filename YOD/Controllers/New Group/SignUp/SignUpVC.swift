//
//  SignUpVC.swift
//  YOD
//
//  Created by abc on 21/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    
    //MARK: - OUTLETS
    @IBOutlet weak var btnAlreadyHaveAnAccount: UIButton!
    
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
    }
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnAlreadyHaveAnAccountAndSignUpTapped(_ sender: UIButton) {
        if sender.tag == 1{
           print("Send to home screen...")
            BaseViewController.sharedBase.sentToHome(isComingFrom: "SignUpButton")
        }else{
        self.navigationController?.popViewController(animated: true)
        }
    }
}


//MARK: - Custom methods extension
extension SignUpVC{
    //TODO: Method initialSetup
    func initialSetup(){
        setAttributedStrings()
    }
    //TODO: Method initialSetup
    func setAttributedStrings(){
        let myMutableString1 = NSMutableAttributedString()
        var simpleString = "Already have an account?"
        let myMutableString = NSAttributedString(string: "\(simpleString) ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :UIColor(red: 96/255, green: 94/255, blue: 95/255, alpha: 1.0)])
        simpleString = "LOG IN"
        let myMutableString2 = NSAttributedString(string: "\(simpleString)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 17.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0), .underlineStyle: NSUnderlineStyle.single.rawValue])
        myMutableString1.append(myMutableString)
        myMutableString1.append(myMutableString2)
        btnAlreadyHaveAnAccount.setAttributedTitle(myMutableString1, for: .normal)
    }
}
