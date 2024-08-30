//
//  CITreeViewData.swift
//  ExpandableTableView
//
//  Created by Mobulous on 12/04/19.
//  Copyright © 2019 Mobulous. All rights reserved.
//

import UIKit

class CITreeViewData {
     let imageArray = [#imageLiteral(resourceName: "girl_img_a"),#imageLiteral(resourceName: "men_style"),#imageLiteral(resourceName: "cute_baby"),#imageLiteral(resourceName: "pillow_red"),#imageLiteral(resourceName: "Gadgets_hit")]
     let subTitleArray = ["Kurta and Suits, Tops and Tees, Dresses","T Shirts, Shirts, Shoes, Jeans","Brand,  Clothing, Footwear","Bedsheets, Blankets, Towels","Headphones"]
    let title : String
    let subTitle: String
    let imageForBackground: UIImage
    var isParent: Bool
    var isLastChild: Bool
    var children : [CITreeViewData]
    
    init(title : String,subTitle: String,imageForBackground: UIImage,isParent:Bool,isLastChild:Bool ,children: [CITreeViewData]) {
        self.title = title
        self.children = children
        self.subTitle = subTitle
        self.imageForBackground = imageForBackground
        self.isParent = isParent
        self.isLastChild = isLastChild
    }
    
    convenience init(title : String, subTitle: String, imageForBackground: UIImage,isParent:Bool,isLastChild:Bool) {
        self.init(title: title, subTitle: subTitle, imageForBackground: imageForBackground,isParent: isParent ,isLastChild:isLastChild, children: [CITreeViewData]())
    }
    
    func addChild(_ child : CITreeViewData) {
        self.children.append(child)
    }
    
    func removeChild(_ child : CITreeViewData) {
        self.children = self.children.filter( {$0 !== child})
    }
}

extension CITreeViewData {
    
    static func getDefaultCITreeViewData() -> [CITreeViewData] {
        
        let subChild121 = CITreeViewData(title: "Kurtas & Suits",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild122 = CITreeViewData(title: "Ethnic Dresses",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild123 = CITreeViewData(title: "Skirts & Palazzos",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild124 = CITreeViewData(title: "Dupattas & Shawls",subTitle: "", imageForBackground:UIImage(),isParent:false ,isLastChild:true)
        
        let child11 = CITreeViewData(title: "Brands",subTitle: "", imageForBackground:UIImage(),isParent:false,isLastChild:false)
        let child12 = CITreeViewData(title: "Indian & Fusion Wear", subTitle: "", imageForBackground: UIImage(),isParent:false ,isLastChild:false, children:[subChild121, subChild122, subChild123, subChild124])
        let child13 = CITreeViewData(title: "Western Wear",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child14 = CITreeViewData(title: "Footwear",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
         let child15 = CITreeViewData(title: "Jewellery",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let parent1 = CITreeViewData(title: "WOMEN",subTitle: "Kurta and Suits, Tops and Tees, Dresses", imageForBackground:#imageLiteral(resourceName: "girl_img_a") ,isParent:true ,isLastChild:false, children: [child11, child12, child13, child14, child15])
        
//        let subChild221 = CITreeViewData(title: "Discovery",subTitle: "", imageForBackground: UIImage(named: "")!)
//        let subChild222 = CITreeViewData(title: "Evoque",subTitle: "", imageForBackground: UIImage(named: "")!)
//        let subChild223 = CITreeViewData(title: "Defender",subTitle: "", imageForBackground: UIImage(named: "")!)
//        let subChild224 = CITreeViewData(title: "Freelander",subTitle: "", imageForBackground: UIImage(named: "")!)
        
        let child21 = CITreeViewData(title: "Brands",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child22 = CITreeViewData(title: "Topwear",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child23 = CITreeViewData(title: "Bottomwear",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child24 = CITreeViewData(title: "Sports & Active Wear",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child25 = CITreeViewData(title: "Inner Wear & Sleepwear",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child26 = CITreeViewData(title: "Suits & Blazers",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let parent2 = CITreeViewData(title: "MEN",subTitle: "T Shirts, Shirts, Shoes, Jeans", imageForBackground: #imageLiteral(resourceName: "men_style") ,isParent:true,isLastChild:false ,children: [child21, child22,child23, child24, child25, child26])
        
        
        let child31 = CITreeViewData(title: "Explore Kids Store",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child32 = CITreeViewData(title: "Brands",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
         let subChild331 = CITreeViewData(title: "T-shirts",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild332 = CITreeViewData(title: "Shirts",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild333 = CITreeViewData(title: "Jeans & Trousers",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild334 = CITreeViewData(title: "Pants",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild335 = CITreeViewData(title: "Clothing Sets",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild336 = CITreeViewData(title: "Indian Wear",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let child33 = CITreeViewData(title: "Boys Clothing",subTitle: "", imageForBackground: UIImage(), isParent:false,isLastChild:false,children:[subChild331, subChild332, subChild333, subChild334, subChild335, subChild336])
        let parent3 = CITreeViewData(title: "KIDS",subTitle: "Brand,  Clothing, Footwear", imageForBackground: #imageLiteral(resourceName: "cute_baby") ,isParent:true,isLastChild:false , children: [child31, child32,child33])
        
        
         let subChild441 = CITreeViewData(title: "Plants & Planters",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild442 = CITreeViewData(title: "Clocks",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild443 = CITreeViewData(title: "Mirrors",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild444 = CITreeViewData(title: "Wall Shelves",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        let subChild445 = CITreeViewData(title: "Fountains",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:true)
        
        let child41 = CITreeViewData(title: "Explore Home Store",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child42 = CITreeViewData(title: "Brands",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child43 = CITreeViewData(title: "Curtains",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child44 = CITreeViewData(title: "Home Decor",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false,children:[subChild441,subChild442,subChild443,subChild444,subChild445])
        
        let parent4 = CITreeViewData(title: "SPORTS",subTitle: "Sports T-shirt, Sports Shoes", imageForBackground:#imageLiteral(resourceName: "men_vest"),isParent:true ,isLastChild:false,children:[child41,child44,child43,child42])
        
        
        
//        let subChild531 = CITreeViewData(title: "Cayman",subTitle: "", imageForBackground: UIImage(named: "")!)
//        let subChild532 = CITreeViewData(title: "911",subTitle: "", imageForBackground: UIImage(named: "")!)
        
        let child51 = CITreeViewData(title: "Explore Audio Store",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child52 = CITreeViewData(title: "Headphones",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child53 = CITreeViewData(title: "Speakers",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child54 = CITreeViewData(title: "Smart Wearables",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        
        let parent5 = CITreeViewData(title: "ACCESSORIES",subTitle: "Headphones", imageForBackground: #imageLiteral(resourceName: "bagpack_side") ,isParent:true ,isLastChild:false,children:[child51,child52,child53,child54])
        
        
        let child61 = CITreeViewData(title: "Ear Phones",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child62 = CITreeViewData(title: "Explore Audio Store",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child63 = CITreeViewData(title: "Speakers",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        let child64 = CITreeViewData(title: "Goggles",subTitle: "", imageForBackground: UIImage(),isParent:false,isLastChild:false)
        
        let parent6 = CITreeViewData(title: "SALE",subTitle: "Up to 40% OFF", imageForBackground: #imageLiteral(resourceName: "bluetooth_speaker") ,isParent:true ,isLastChild:false,children:[child61,child62,child63,child64])
//        return [parent5,parent2,parent1,parent3,parent4]
        return [parent2,parent1,parent3,parent5,parent4,parent6]
    }
    
    
}
