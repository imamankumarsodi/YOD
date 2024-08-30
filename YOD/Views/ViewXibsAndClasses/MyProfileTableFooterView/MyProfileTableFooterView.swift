//
//  MyProfileTableFooterView.swift
//  YOD
//
//  Created by abc on 06/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class MyProfileTableFooterView: UIView {

    //LOGOUT ACTION
    @IBAction func btn_LogOut(_ sender: Any) {
        BaseViewController.sharedBase.checkAutoLogin()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
