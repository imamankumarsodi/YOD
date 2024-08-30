//
//  AddNewAddressVC.swift
//  YOD
//
//  Created by abc on 05/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class AddNewAddressVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnHeaderTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btn_Cancel (_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_Save (_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
