//
//  SavedCardsVC.swift
//  YOD
//
//  Created by Mac-As on 30/05/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SavedCardsVC: UIViewController {

    
   @IBOutlet weak var tbl_SavedCard: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tbl_SavedCard.register(UINib(nibName: "SavedScreenCell", bundle: nil), forCellReuseIdentifier: "SavedScreenCell")
    }
    

    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TableView Delegate and Data Source
//MARK:-
extension SavedCardsVC: UITableViewDelegate, UITableViewDataSource {
    
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl_SavedCard.dequeueReusableCell(withIdentifier: "SavedScreenCell", for: indexPath) as! SavedScreenCell
       
        if indexPath.row == 1 {
            cell.img_CardType.image = #imageLiteral(resourceName: "mastercard")
            cell.btn_Selection.setImage(#imageLiteral(resourceName: "selected_new_number"), for: .normal)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
