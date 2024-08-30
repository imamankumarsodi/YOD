//
//  ReturnOrderPopUpVC.swift
//  YOD
//
//  Created by Syed Zuber on 27/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

protocol returnOrderItemProcced {
    
    func returnOrderItem(proceedStatus: String)
}

class ReturnOrderPopUpVC: UIViewController {

    var returnOrderDelegate: returnOrderItemProcced?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_Invisible_Top_Forback(_ sender: Any) {
//        self.navigationController?.popViewController(animated: false)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btn_ProceedAhead(_ sender: Any) {
        
        _ = SweetAlert().showAlert("YOD", subTitle: "Your request for the return of the order has been raised", style: .success, buttonTitle: "OK", action: { (OK) in
            self.dismiss(animated: true, completion: nil)
            
            self.returnOrderDelegate?.returnOrderItem(proceedStatus: "Proceed")
        })
    }
    
    
}
