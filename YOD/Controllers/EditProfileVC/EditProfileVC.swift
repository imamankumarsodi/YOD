//
//  EditProfileVC.swift
//  YOD
//
//  Created by abc on 06/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnSaveDetailsTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }

}
