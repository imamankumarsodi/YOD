//
//  LoginMethods.swift
//  YOD
//
//  Created by abc on 11/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import Foundation
import RealmSwift
class BaseViewController:UIViewController{
    static let sharedBase = BaseViewController()
    func checkAutoLogin(){
        let realm = try! Realm()
        if realm.objects(UserInfo.self).first != nil{
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            let nav = UINavigationController(rootViewController: vc)
            
//            let homeTab = vc.viewControllers?[0] as! HomeVC
//            homeTab.isComingFrom = isComingFrom
            
            
            nav.isNavigationBarHidden = true
            (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = nav
        }else{
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
//            let nav = UINavigationController(rootViewController: vc)
//            nav.isNavigationBarHidden = true
//            (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = nav
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            let nav = UINavigationController(rootViewController: vc)
            
            let homeTab = vc.viewControllers?[0] as! HomeVC
            homeTab.isComingFrom = "AutoLoginSignUp"
            
            nav.isNavigationBarHidden = true
            (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = nav
        }
    }
    //TODO: Method Send to home
    func sentToHome(isComingFrom: String){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        let nav = UINavigationController(rootViewController: vc)
        
        let homeTab = vc.viewControllers?[0] as! HomeVC
        homeTab.isComingFrom = isComingFrom
        
        nav.isNavigationBarHidden = true
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = nav
    }
    //TODO: Method send to bag
    func sentToBag(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        vc.selectedIndex = 4
        (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = nav
    }
    
}

