//
//  MacrosForAll.swift
//  Monami
//
//  Created by abc on 22/11/18.
//  Copyright © 2018 mobulous. All rights reserved.
//

import Foundation
import UIKit
import Lottie

public class MacrosForAll:NSObject{
    public class var sharedInstanceMacro: MacrosForAll {
        struct Singleton {
            static let instance: MacrosForAll = MacrosForAll()
        }
        return Singleton.instance
    }
    
    override init() {}
    //MARK: - Variables
    var lat = String()
    var log = String()
    

    //TODO: App Delegate
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //TODO: Base URL
//    let API_BASE_URL = "http://mobulous.co.in/intlo/services/"
    
    let API_BASE_URL = "https://myintlo.com/services/"    //Secure with https:
    
    
    let appName = "YOD"
    let animationView = LOTAnimationView(name: "hourglass1")
    let animationView1 = LOTAnimationView(name: "sendMessage")
    let likeAnimationView = LOTAnimationView(name: "green_like")
    let dislikeAnimationView = LOTAnimationView(name: "dislike")
    let deleteAnimationView = LOTAnimationView(name: "delete")
    
    //TODO: App Languages
    enum AppLanguage : String {
        case ENGLISH = "en"
    }
    
    enum APINAME : String {
        case login                = "login"
        case socialLogin          = "socialLogin"
        case signup               = "signup"
        case checkSocial          = "checkSocial"
        case editProfile          = "editProfile"
        case notificationStatus   = "notificationStatus"
        case categoryList         = "categoryList"
        case myFavouritelisting   = "myFavouritelisting"
        case favourite            = "favourite"
        case businessownerDetails = "businessownerDetails"
        case businessownerList    = "businessownerList"
        case contactUs            = "contactUs"
        case likes                = "likes"
        case addCart              = "addCart"
        case userOrderList        = "userOrderList"
        case UserConfirmOrder     = "UserConfirmOrder"
        case myCart               = "myCart"
        case applyRewardPoints    = "applyRewardPoints"
        case deleteCart           = "deleteCart"
        case homeBusinessownerList = "homeBusinessownerList"
        case checkExistancy       = "checkExistancy"
        case orderPlace           = "orderPlace"
        case userRewardpoint      = "userRewardpoint"
        case userConfirmOrderOnline = "userConfirmOrderOnline"
        case getNotification      = "getNotification"
        case userPlaceOrder       = "userPlacedOrder"
        case userPlacedReorder    = "userPlacedReorder"
        case applyRewardPointonorder = "applyRewardPointonorder"
        case userfeedBack         = "userFeedback"
    }
    enum VALIDMESSAGE : String {
        //Basic Signup
        case WrongOTP                                = "You've entered wrong OTP."
        case SelectCountryCode                       = "Please select country code."
        case EnterFullName                           = "Please enter full name."
        case EnterFirstName                          = "Please enter first name."
        case EnterLastName                           = "Please enter last name."
        case EnterValidFullName                      = "Please enter your valid full name. (Full Name contains A-Z                  or a-z, no special character or digits are allowed.)"
        case EnterValidFullNameLength                = "Full name length should atleast of 4 characters."
        case EnterMobileNumber                       = "Please enter phone number."
        
        case EmailAddressNotBeBlank                  = "Please enter Email ID."
        case EnterEmail                              = "Please enter email address."
        case EnterDOB                                = "Please enter date of birth."
        case EnterAddress                            = "Please enter Address."
        case EnterValidEmail                         = "Please enter valid email address."
        case PasswordNotBeBlank                      = "Please enter password."
        case PasswordShouldBeLong                    = "Password length should be 6-10 characters."
        case ConfirmPasswordNotBeBlank               = "Please enter confirm password."
        case ConfirmPasswordShouldBeLong             = "Confirm password length should be 6-10 characters."
        case NewPasswordNotBeBlank                   = "Please enter new password."
        case NewPasswordShouldBeLong                 = "New password length should be 6-10 characters."
        case PasswordAndConfimePasswordNotMatched    = "Password and Confirm Pasword is not matching."
        case AcceptTermsAndConditions                = "Please accept terms & conditions."
        case CUIDAlert                               = "Please enter CUID."
        case invalidCUIDAlert                        = "Please enter correct CUID."
        case CUIDMaxLength                           = "CUID length should be 6 digit long."
        case OldPasswordNotBeBlank                      = "Please enter old password."
        case OldPasswordShouldBeLong                    = "Old Password length should be 6-10 characters."
        case NewPasswordAndConfimePasswordNotMatched    = "New Password and Confirm Pasword is not matching."
        case LoginTokenExpire                       = "User already logged in some other device."
        case IncorrectOTP                           = "Incorrect OTP."
        case WantToLogout                           = "Are you sure?\nYou want to Log out!"
        case WantToDelete                           = "Are you sure?\nYou want to delete this item from your cart!"
        case ContinueApp                            = "Please enter CUID to continue in the app."
        case ProfileUpdate                          = "Profile updated successfully."
        case DeleteAccess                           = "Are you sure?\nYou want to delete access of "
        case UnfollowChild                          = "Are you sure?\nYou want to unfollow "
        case DeletePost                             = "Are you sure?\nYou want to delete post of "
        case EnterDetails                           = "Please enter details"
        case EmptyCart                              = "Your cart is empty!"
        case Nofavourite                            = "Your favourite list is empty!"
        case ServiceProviderNotAcceptingOrder       = "This service is closed now, try again later"
    }
    enum ERRORMESSAGE : String {
        case NoInternet                              = "There is no internet connection. Please try again later."
        case ErrorMessage                            = "There is some error occured. Please try again later."
    } 
}

//MARK: - Extension Lottie loader
extension MacrosForAll{
    func showLoader(view: UIView) {
        Indicator.shared.showProgressView(view)

//        animationView.isHidden = false
//        animationView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
//        animationView.center = view.center
//        animationView.contentMode = .center
//        animationView.contentMode = UIViewContentMode(rawValue: UIViewContentMode.scaleAspectFill.rawValue/2)!
//        animationView.clipsToBounds = true
//        animationView.animationSpeed = 1.25
//        animationView.loopAnimation = true
//        view.addSubview(animationView)
//        view.isUserInteractionEnabled = false
//        animationView.play()
    }
    
    func hideLoader(view: UIView) {
        Indicator.shared.hideProgressView()
        
//        animationView.isHidden = true
//        view.isUserInteractionEnabled = true
//        animationView.stop()
    }
    
    func showLoaderMessage(view: UIView) {
        Indicator.shared.showProgressView(view)
//        view.alpha = 0.80
//        animationView1.isHidden = false
//        animationView1.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        animationView1.center = view.center
//        animationView1.contentMode = .center
//        animationView1.animationSpeed = 1.25
//        animationView1.loopAnimation = true
//        view.addSubview(animationView1)
//        animationView1.play()
    }
    
    func hideLoaderMessage(view: UIView) {
        Indicator.shared.hideProgressView()

//        animationView1.isHidden = true
//        animationView1.stop()
//        view.alpha = 1
    }
    
    func showLoaderLike(view: UIView) {
        Indicator.shared.showProgressView(view)
//        view.alpha = 0.80
//        likeAnimationView.isHidden = false
//        likeAnimationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        likeAnimationView.center = view.center
//        likeAnimationView.contentMode = .center
//        likeAnimationView.animationSpeed = 1.25
//        likeAnimationView.loopAnimation = true
//        view.addSubview(likeAnimationView)
//        likeAnimationView.play()
    }
    
    func hideLoaderLike(view: UIView) {
        Indicator.shared.hideProgressView()
//        likeAnimationView.isHidden = true
//        likeAnimationView.stop()
//        view.alpha = 1
    }
    
    func showLoaderDisLike(view: UIView) {
        Indicator.shared.showProgressView(view)
//        view.alpha = 0.80
//        dislikeAnimationView.isHidden = false
//        dislikeAnimationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        dislikeAnimationView.center = view.center
//        dislikeAnimationView.contentMode = .center
//        dislikeAnimationView.animationSpeed = 1.25
//        dislikeAnimationView.loopAnimation = true
//        view.addSubview(dislikeAnimationView)
//        dislikeAnimationView.play()
    }
    
    func hideLoaderDisLike(view: UIView) {
        Indicator.shared.hideProgressView()
//        dislikeAnimationView.isHidden = true
//        dislikeAnimationView.stop()
//        view.alpha = 1
    }
    
    func showLoaderDelete(view: UIView) {
        Indicator.shared.showProgressView(view)
//        view.alpha = 0.80
//        deleteAnimationView.isHidden = false
//        deleteAnimationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        deleteAnimationView.center = view.center
//        deleteAnimationView.contentMode = .center
//        deleteAnimationView.animationSpeed = 1.25
//        deleteAnimationView.loopAnimation = true
//        view.addSubview(deleteAnimationView)
//        deleteAnimationView.play()
    }
    
    func hideLoaderDelete(view: UIView) {
        Indicator.shared.hideProgressView()
//        deleteAnimationView.isHidden = true
//        deleteAnimationView.stop()
//        view.alpha = 1
    }

    
}
