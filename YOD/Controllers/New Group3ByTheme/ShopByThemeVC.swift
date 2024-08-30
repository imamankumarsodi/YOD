//
//  ShopByThemeVC.swift
//  YOD
//
//  Created by Mac-As on 03/06/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ShopByThemeVC: UIViewController {

    
    @IBOutlet weak var tbl_ShopByTheme: UITableView!
    
    var imageArr = [#imageLiteral(resourceName: "banner_1"), #imageLiteral(resourceName: "banner_2")]
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "ShopThemeCell", bundle: nil)
        tbl_ShopByTheme.register(nib, forCellReuseIdentifier: "ShopThemeCell")
    }
    
    @IBAction func btn_BackToHome(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}

//MARK:- TableView Delegates and Data Source
//MARK:-
extension ShopByThemeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tbl_ShopByTheme.dequeueReusableCell(withIdentifier: "ShopThemeCell", for: indexPath) as! ShopThemeCell
        
        cell.img_items.image = imageArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
