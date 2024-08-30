//
//  ExchangeProductVC.swift
//  YOD
//
//  Created by abc on 08/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit

class ExchangeProductVC: UIViewController {
    //MARK: - OUTLETS
    @IBOutlet weak var lblProductDetails: UILabel!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var lblProductDesc: UILabel!
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var reasonTable: UITableView!
    
    
    
    //MARK: - VARIABLES
    let sizeArray = ["36","39","40","42","46","48"]
    let colorArray = [#colorLiteral(red: 0.8139386773, green: 0.6868701577, blue: 0.09287340194, alpha: 1),#colorLiteral(red: 0.4872524142, green: 0.7709157467, blue: 0.4616471529, alpha: 1),#colorLiteral(red: 0.7020815015, green: 0.04069697112, blue: 0.3631163836, alpha: 1),#colorLiteral(red: 0.1617099941, green: 0.7110761404, blue: 0.7590293884, alpha: 1)]
    let reasonArray = ["I Received A Defective/Wrong Product", "Size Too Large", "Size Too small"]
//    var footerView:exchangeRequestFooter = Bundle.main.loadNibNamed("exchangeRequestFooter", owner: self, options: nil)!.first! as! exchangeRequestFooter   //No Need Made Cell
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialSetup()
        
//        reasonTable.frame = CGRect(x: reasonTable.frame.origin.x, y: reasonTable.frame.origin.y, width: reasonTable.frame.size.width, height: reasonTable.contentSize.height)
//        reasonTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        reasonTable.frame = CGRect(x: reasonTable.frame.origin.x, y: reasonTable.frame.origin.y, width: reasonTable.frame.size.width, height: reasonTable.contentSize.height)
//        reasonTable.reloadData()
    }
    
    override func viewDidLayoutSubviews(){
//        reasonTable.frame = CGRect(x: reasonTable.frame.origin.x, y: reasonTable.frame.origin.y, width: reasonTable.frame.size.width, height: reasonTable.contentSize.height)
//        reasonTable.reloadData()
    }
    
    //MARK: - Actions, Gestures
    //TODO: Actions
    @IBAction func btnHeaderTapped(_ sender: UIButton) {
        if sender.tag == 1{
            self.navigationController?.popViewController(animated: true)
        }else if sender.tag == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 3{
            print("Share karana hai")
        }else if sender.tag == 4{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
//            BaseViewController.sharedBase.sentToBag()
        }
    }
    
    @IBAction func btnFooterTapped(_ sender: UIButton) {
        if sender.tag == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyWistListVC") as! MyWistListVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
//            BaseViewController.sharedBase.sentToBag()
//            _ = SweetAlert().showAlert("YOD", subTitle: "Your request for exchange of the order no. has been rasied.", style: .success)
            _ = SweetAlert().showAlert("YOD", subTitle: "Your request for exchange of the order no. has been rasied.", style: .success, buttonTitle: "OK", action: { (OK) in
                
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
    

}

//MARK: - Custom methods extension
extension ExchangeProductVC{
    //TODO: Method initialSetup
    func initialSetup(){
        lblProductDetails.attributedText = UpdateUIClass.updateSharedInstance.updateExchangeOrderScreenLabel("Lee Jeans", "Mens Blue Fit Mid-Rise Jeans", "32", "Applied", "2000", "4000", "50")
        colorCollectionView.reloadData()
        lblProductDesc.attributedText = UpdateUIClass.updateSharedInstance.updateExchangeOrderProductDescriptionLabel("Product Description","Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
        
        
//        reasonTable.tableFooterView = footerView
//        reasonTable.reloadData()
    }
    
}

//MARK: - CollectionView dataSource and delegates
extension ExchangeProductVC:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    //TODO: Number of section in collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //TODO: Number of items in section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == sizeCollectionView {
            return sizeArray.count
        }
        else {
            return colorArray.count
        }
        
    }
    //TODO: Cell for item at indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == sizeCollectionView {
            
            sizeCollectionView?.register(UINib(nibName: "SizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SizeCollectionViewCell")
            let collectionViewItem = sizeCollectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionViewCell", for: indexPath) as! SizeCollectionViewCell
            collectionViewItem.lblSize.text = sizeArray[indexPath.row]
            return collectionViewItem
        }
        else {
            colorCollectionView?.register(UINib(nibName: "SizeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SizeCollectionViewCell")
            let collectionViewItem = colorCollectionView.dequeueReusableCell(withReuseIdentifier: "SizeCollectionViewCell", for: indexPath) as! SizeCollectionViewCell
            collectionViewItem.lblSize.backgroundColor = colorArray[indexPath.row]
            collectionViewItem.lblSize.layer.cornerRadius = 10
            return collectionViewItem
        }
        
        
    }
    //TODO: CollectionView flow layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == sizeCollectionView {
            return CGSize(width: 30, height:30)
        }
            return CGSize(width: 20, height:20)
    }

}

extension ExchangeProductVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
        
        if section == 0 {
            return 3
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            reasonTable.register(UINib(nibName: "DeliveryAddressTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "DeliveryAddressTableViewCellAndXib")
            let cell = reasonTable.dequeueReusableCell(withIdentifier: "DeliveryAddressTableViewCellAndXib", for: indexPath) as! DeliveryAddressTableViewCellAndXib
            cell.lblTitle.text = reasonArray[indexPath.row]
            return cell
        }
        else {
            
            
            reasonTable.register(UINib(nibName: "FooterDataTableCell", bundle: nil), forCellReuseIdentifier: "FooterDataTableCell")
            let cell = reasonTable.dequeueReusableCell(withIdentifier: "FooterDataTableCell", for: indexPath) as! FooterDataTableCell
            cell.btn_AddAddress.addTarget(self, action: #selector(btn_AddressPressed), for: .touchUpInside)
            return cell
        }
        
        
    }
    
    @objc func btn_AddressPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
}
