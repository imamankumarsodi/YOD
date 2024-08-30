//
//  SearchVC.swift
//  YOD
//
//  Created by abc on 22/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var tblSearch: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchResultArray = ["Women Kurtas", "Women Tops", "Women Skirts", "Women Palazzos"]
    
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initialSetup()
    }
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - Custom methods extension
extension SearchVC{
    //TODO: Method initialSetup
    func initialSetup(){
        searchBar.backgroundImage = UIImage()
        tblSearch.tableFooterView = UIView()
        tblSearch.reloadData()
        
    }
    
}
//MARK: - TableView dataSource and delegates extension
extension SearchVC:UITableViewDelegate,UITableViewDataSource{
    //TODO: Number of items in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultArray.count
    }
    //TODO: Cell for item at indexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tblSearch.register(UINib(nibName: "SearchTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "SearchTableViewCellAndXib")
        let cell = tblSearch.dequeueReusableCell(withIdentifier: "SearchTableViewCellAndXib", for: indexPath) as! SearchTableViewCellAndXib
        cell.lbl_SearchResult.text = searchResultArray[indexPath.row]
        return cell
    }
    
}
