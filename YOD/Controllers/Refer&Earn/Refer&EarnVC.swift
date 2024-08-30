//
//  Refer&EarnVC.swift
//  YOD
//
//  Created by Mac-As on 04/06/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class Refer_EarnVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func btn_BackToProfile(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Share(_ sender: UIButton) {
        shareApp()
    }

    
    func shareApp() {
        //        let items: [Any] = ["ForoPina is a place to gain and share knowledge. It's a platform to ask questions and connect with people who contribute unique insights and quality answers\n\n\n".localized(), self.shareTopiclink]
        
        let items: [Any] = []
        
//        print("SHARE TOPIC LINK", self.shareTopiclink)
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        ac.completionWithItemsHandler = { (activity, success, items, error) in
            print(success ? "SUCCESS!" : "FAILURE")
            
            
            if success == true {
                
//                if activity == UIActivityType.postToFacebook {
//                    self.shareAppAPICall(shareWith: "facebook")
//                }
//                else if activity == UIActivityType.postToTwitter {
//                    self.shareAppAPICall(shareWith: "twitter")
//                }
//                else if activity == UIActivityType.mail {
//                    self.shareAppAPICall(shareWith: "mail")
//                }
//                else if activity == UIActivityType.message {
//                    self.shareAppAPICall(shareWith: "message")
//                }
//                else if activity == UIActivityType.init(rawValue: "com.google.Gmail.ShareExtension") {
//                    self.shareAppAPICall(shareWith: "gmail")
//                }
//                else if activity == UIActivityType.init("net.whatsapp.WhatsApp.ShareExtension") {
//                    self.shareAppAPICall(shareWith: "whatsApp")
//                }
                //                else {
                //                    self.shareAppAPICall(shareWith: "Others")
                //                }
                
            }
            else {
                print("Not Success")
            }
            
        }
        present(ac, animated: true)
    }
}
