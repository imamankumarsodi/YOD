//
//  CategoryVC.swift
//  YOD
//
//  Created by abc on 22/02/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import UIKit
import CITreeView


class CategoryVC: UIViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var tblCategories: CITreeView!

    @IBOutlet weak var searchBar: UISearchBar!
    //MARK: - Variables
    var cellExpanded: Bool = false
    var data : [CITreeViewData] = []
    let imageArray = [#imageLiteral(resourceName: "girl_img_a"),#imageLiteral(resourceName: "men_style"),#imageLiteral(resourceName: "cute_baby"),#imageLiteral(resourceName: "pillow_red"),#imageLiteral(resourceName: "Gadgets_hit")]
    let titleArray = ["WOMEN","MEN","KIDS","HOME","GADGETS","SALE"]
    let subTitleArray = ["Kurta and Suits, Tops and Tees, Dresses","T Shirts, Shirts, Shoes, Jeans","Brand,  Clothing, Footwear","Bedsheets, Blankets, Towels","Headphones"]
    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        data = CITreeViewData.getDefaultCITreeViewData()
        tblCategories.collapseNoneSelectedRows = false
        tblCategories.register(UINib(nibName: "CategoryTableViewCellAndXib", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCellAndXib")

        // Do any additional setup after loading the view.
        initialSetup()
    }

}


//MARK: - Custom methods extension
extension CategoryVC{
    //TODO: Method initialSetup
    func initialSetup(){
        searchBar.backgroundImage = UIImage()
        tblCategories.reloadData()

    }
   
}

extension CategoryVC: CITreeViewDataSource, CITreeViewDelegate
{
    
    func treeView(_ treeView: CITreeView, atIndexPath indexPath: IndexPath, withTreeViewNode treeViewNode: CITreeViewNode) -> UITableViewCell {
        let cell = treeView.dequeueReusableCell(withIdentifier: "CategoryTableViewCellAndXib") as! CategoryTableViewCellAndXib
        let dataObj = treeViewNode.item as! CITreeViewData
        cell.lblTitle.text = dataObj.title
        cell.imgBackground.image = dataObj.imageForBackground
        cell.lblSubtitle.text = dataObj.subTitle
        if dataObj.children.count == 0
        {
            cell.lblTitle.font = UIFont.systemFont(ofSize: 17)
            cell.imgDropDown.isHidden = true
            
        }
        else {
            cell.lblTitle.font = UIFont.boldSystemFont(ofSize: 17)
            cell.imgDropDown.isHidden = false
            if dataObj.isParent == false{
                            print("is parent")
                print("cell width is ",cell.bounds.width )
//              cell.leadingConstraintForDropDown.constant = cell.bounds.width - cell.lblTitle.bounds.width - 100
                        }
        }
        
        if dataObj.isLastChild == true{
            cell.constraintLeading.constant = 30
        }
        
        else{
            cell.constraintLeading.constant = 8
        }
//        if dataObj.isParent == true{
//            print("is parent")
//        }
//        else{
//            if dataObj.children.count != 0 {
//
//
//                print("more than zero children")
//                let childrenCount = dataObj.children.count
//                let maxCount = childrenCount + indexPath.row
//                print("max count is", maxCount)
//                if indexPath <= [indexPath.row, maxCount]{
//                    cell.constraintLeading.constant = 30
//                }
//
//            }
//            else {
//
//            }
//        }
        
        return cell;
    }
    
    func treeViewSelectedNodeChildren(for treeViewNodeItem: AnyObject) -> [AnyObject] {
        if let dataObj = treeViewNodeItem as? CITreeViewData {
            return dataObj.children
        }
        return []
    }
    
    func treeViewDataArray() -> [AnyObject] {
        return data
    }
    
    func treeView(_ treeView: CITreeView, heightForRowAt indexPath: IndexPath, withTreeViewNode treeViewNode: CITreeViewNode) -> CGFloat {
        var height:CGFloat?
        let dataObj = treeViewNode.item as! CITreeViewData
//        if dataObj.children.count == 0
//        {
//            height = 50
//        }
//        else {
//            if dataObj.isParent == true{
//                height = 120
//            }
//            else{
//                height = 50
//
//            }
//        }
        
        if dataObj.isParent == true{
            height = 120
        }
        else{
            height = 50
            
        }
//        for cell in treeView.visibleCells{
//            height = 120
//            cell.bounds.size.height = 120
//        }
     
        return height!
    }
    
    func treeView(_ treeView: CITreeView, didSelectRowAt treeViewNode: CITreeViewNode, atIndexPath indexPath: IndexPath) {
        let dataObj = treeViewNode.item as! CITreeViewData
        print("index path is ", indexPath)
        print("number of children", dataObj.children.count)
        
        if dataObj.children.count == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductListingVC") as! ProductListingVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
     
    }
    
    func treeView(_ treeView: CITreeView, didDeselectRowAt treeViewNode: CITreeViewNode, atIndexPath indexPath: IndexPath) {
        
    }
    
    func willExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func didExpandTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func willCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    func didCollapseTreeViewNode(treeViewNode: CITreeViewNode, atIndexPath: IndexPath) {
        
    }
    
    
}


