//
//  ReturnOrderVC.swift
//  YOD
//
//  Created by abc on 08/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ReturnOrderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btn_requestReturn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReturnOrderPopUpVC") as! ReturnOrderPopUpVC
        
//        self.navigationController?.pushViewController(vc, animated: false)
        self.navigationController?.present(vc, animated: true, completion: nil)
        
    }
    
    
}
