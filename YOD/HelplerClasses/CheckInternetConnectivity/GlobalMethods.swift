//
//  import UIKit     GlobleMethods.swift
//  
//
//  Created by Callsoft on 19/12/17.


import UIKit
import SystemConfiguration

public class InternetConnection {
    
    static  let internetshared = InternetConnection()
    
    public func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
 
}



// SINGLTON CLASS FOR SCREEN NAME  that on That screen notification popup will not come
class ScreeNNameClass {
    static let shareScreenInstance = ScreeNNameClass()
    var  screenName = ""
    private init() {}
}

//Global Functions
class GlobalFunctions {
    
   static let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    
}


// UPDATE UI CLASS
class UpdateUIClass {
    static  let updateSharedInstance = UpdateUIClass()
    
    //TODO: Update collectionView price label
    func updateCollectionViewLabel(_ price:String,_ strikePrice:String,_ discountPercents:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "Rs\(price)  ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 13.0)!, .foregroundColor :UIColor.black])
        let myMutableString2 = NSAttributedString(string: "Rs\(strikePrice)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 12.0)!, .foregroundColor :UIColor.darkGray, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.darkGray])
        let myMutableString3 = NSAttributedString(string: "  \(discountPercents)%OFF", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 13.0)!, .foregroundColor :UIColor(red: 195/255, green: 10/255, blue: 0/255, alpha: 1.0)])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        return myMutableString
    }
    
    func updateCollectionViewLabelForSimilar(_ price:String,_ strikePrice:String,_ discountPercents:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "Rs\(price)  ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 13.0)!, .foregroundColor :UIColor.black])
        let myMutableString2 = NSAttributedString(string: "Rs\(strikePrice)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 12.0)!, .foregroundColor :UIColor.darkGray, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.darkGray])
        let myMutableString3 = NSAttributedString(string: "  \(discountPercents)%OFF", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 11.0)!, .foregroundColor :UIColor(red: 195/255, green: 10/255, blue: 0/255, alpha: 1.0)])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        return myMutableString
    }
    
    
    func updateAmxLabel(_ headingText:String,_ contentText:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(headingText)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        let myMutableString2 = NSAttributedString(string: "\(contentText)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        return myMutableString
    }
    func strikeSize(_ size:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(size)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.black, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.black])
        myMutableString.append(myMutableString1)
        return myMutableString
    }
    
    
    func updateMyOrderScreenLabel(_ brand:String,_ nameDetail:String,_ size:String,_ qty:String,_ offerStatus:String,_ price:String,_ strikePrice:String,_ orderStatus:String,_ oreder_date:String,_ shipmentAddress:String,_ discountPercentage:String)->NSMutableAttributedString{
        let myMutableString = NSMutableAttributedString()
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        let myMutableString1 = NSMutableAttributedString(string: "\(brand)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 15.0)!, .foregroundColor :UIColor.black])
        myMutableString1.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString1.length))
        
        
        let myMutableString2 = NSMutableAttributedString(string: "\(nameDetail)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString2.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString2.length))
        
        
        let myMutableString3 = NSMutableAttributedString(string: "Size: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString3.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString3.length))
        
        let myMutableString4 = NSMutableAttributedString(string: "\(size) | ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString4.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString4.length))
        
        
        
        let myMutableString5 = NSMutableAttributedString(string: "Qty: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString5.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString5.length))
        
        let myMutableString6 = NSMutableAttributedString(string: "\(qty)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString6.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString6.length))
        
        
        let myMutableString7 = NSMutableAttributedString(string: "Offer: \(offerStatus)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :UIColor(red: 81.0/255.0, green: 184.0/255.0, blue: 126.0/255.0, alpha: 1.0)])
        myMutableString7.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString7.length))
        
        
        let myMutableString8 = NSMutableAttributedString(string: "Rs\(price)  ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 15.0)!, .foregroundColor :UIColor.black])
        myMutableString8.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString8.length))
        
        let myMutableString9 = NSMutableAttributedString(string: "Rs\(strikePrice)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 14.0)!, .foregroundColor :UIColor.darkGray, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.darkGray])
        myMutableString9.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString9.length))

        
        let myMutableString10 = NSMutableAttributedString(string: "  \(discountPercentage)%OFF", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor(red: 206/255, green: 104/255, blue: 89/255, alpha: 1.0)])
        myMutableString10.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString10.length))
        
        
        let style1 = NSMutableParagraphStyle()
        style1.lineSpacing = 11
        let myMutableString11 = NSMutableAttributedString(string: "\nOrder Status: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString11.addAttribute(NSAttributedString.Key.paragraphStyle, value: style1, range: NSRange(location: 0, length: myMutableString11.length))
        
        let myMutableString12 = NSMutableAttributedString(string: "\(orderStatus)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 15.0)!, .foregroundColor :UIColor.black])
        myMutableString12.addAttribute(NSAttributedString.Key.paragraphStyle, value: style1, range: NSRange(location: 0, length: myMutableString12.length))
        
        let myMutableString13 = NSMutableAttributedString(string: "\nOrder Date: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString13.addAttribute(NSAttributedString.Key.paragraphStyle, value: style1, range: NSRange(location: 0, length: myMutableString13.length))
        
        let myMutableString14 = NSMutableAttributedString(string: "\(oreder_date)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString14.addAttribute(NSAttributedString.Key.paragraphStyle, value: style1, range: NSRange(location: 0, length: myMutableString14.length))
        
        
        let style2 = NSMutableParagraphStyle()
        style2.lineSpacing = 0
        let myMutableString15 = NSMutableAttributedString(string: "Shipment Address: ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 15.0)!, .foregroundColor :UIColor.darkGray])
        myMutableString15.addAttribute(NSAttributedString.Key.paragraphStyle, value: style2, range: NSRange(location: 0, length: myMutableString15.length))
        
        let myMutableString16 = NSMutableAttributedString(string: "\(shipmentAddress)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString16.addAttribute(NSAttributedString.Key.paragraphStyle, value: style2, range: NSRange(location: 0, length: myMutableString16.length))
        
    
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        myMutableString.append(myMutableString4)
        myMutableString.append(myMutableString5)
        myMutableString.append(myMutableString6)
        myMutableString.append(myMutableString7)
        myMutableString.append(myMutableString8)
        myMutableString.append(myMutableString9)
        myMutableString.append(myMutableString10)
        myMutableString.append(myMutableString11)
        myMutableString.append(myMutableString12)
        myMutableString.append(myMutableString13)
        myMutableString.append(myMutableString14)
        myMutableString.append(myMutableString15)
        myMutableString.append(myMutableString16)
        
        return myMutableString
    }
    
    func updateExchangeOrderScreenLabel(_ brand:String,_ nameDetail:String,_ size:String,_ offerStatus:String,_ price:String,_ strikePrice:String,_ discountPercents:String)->NSMutableAttributedString{
        
        
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        
        let myMutableString = NSMutableAttributedString()
        
        let myMutableString1 = NSAttributedString(string: "\(brand)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString2 = NSAttributedString(string: "\(nameDetail)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        
        let myMutableString3 = NSAttributedString(string: "Rs\(price)  ", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 16.0)!, .foregroundColor :UIColor.black])
        
        let myMutableString4 = NSAttributedString(string: "Rs\(strikePrice)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray, .strikethroughStyle: NSUnderlineStyle.single.rawValue,NSAttributedString.Key.strikethroughColor:UIColor.darkGray])
        
        let myMutableString5 = NSAttributedString(string: "  \(discountPercents)%OFF\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor(red: 195/255, green: 10/255, blue: 0/255, alpha: 1.0)])
//
//        let myMutableString6 = NSAttributedString(string: "Offer: \(offerStatus)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor(red: 88/255, green: 188/255, blue: 30/255, alpha: 1.0)])
//
//
//        let myMutableString7 = NSAttributedString(string: "Size: \(size)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.append(myMutableString3)
        myMutableString.append(myMutableString4)
        myMutableString.append(myMutableString5)
//        myMutableString.append(myMutableString6)
//        myMutableString.append(myMutableString7)
        
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        
        return myMutableString
    }
    
    
    func updateExchangeOrderProductDescriptionLabel(_ title:String,_ product_Des:String)->NSMutableAttributedString{
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(title)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 17.0)!, .foregroundColor :UIColor.black])
        let myMutableString2 = NSAttributedString(string: "\(product_Des)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.darkGray])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        return myMutableString
    }
    
    func updateExchangeOrderProductDescriptionLabel2(_ title:String,_ product_Des:String)->NSMutableAttributedString{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 0
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(title)\n\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 18.0)!, .foregroundColor :UIColor.black])
        let myMutableString2 = NSAttributedString(string: "\(product_Des)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.black])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        return myMutableString
    }
    func updateHelpCenterDetailLabel(_ title:String,_ product_Des:String,_ size:String,_ qty:String)->NSMutableAttributedString{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(title)\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 15.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        let myMutableString2 = NSAttributedString(string: "\(product_Des), Size:\(size) | Qty:\(qty)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 14.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        return myMutableString
    }
    func updateHelpCenterDeliveryStatusLabel(_ date:String)->NSMutableAttributedString{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "DELIVERED\n", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 12.0)!, .foregroundColor :UIColor(red: 113/255, green: 42/255, blue: 140/255, alpha: 1.0)])
        let myMutableString2 = NSAttributedString(string: "\(date)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 13.0)!, .foregroundColor :App.Fonts_Colour.lessBritness_Black])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        return myMutableString
    }
    
    func updateCouponsLabel(_ title:String,_ product_Des:String)->NSMutableAttributedString{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 0
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(title)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 18.0)!, .foregroundColor :UIColor.lightGray])
        let myMutableString2 = NSAttributedString(string: "\(product_Des)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN_Bold, size: 20.0)!, .foregroundColor :UIColor.black])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        return myMutableString
    }
    
    func updateCouponsLabel2(_ title:String,_ product_Des:String)->NSMutableAttributedString{
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 0
        let myMutableString = NSMutableAttributedString()
        let myMutableString1 = NSAttributedString(string: "\(title)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 18.0)!, .foregroundColor :UIColor.lightGray])
        let myMutableString2 = NSAttributedString(string: "\(product_Des)", attributes:[.font:UIFont(name: App.Fonts.DIN.D_DIN, size: 16.0)!, .foregroundColor :UIColor.black])
        myMutableString.append(myMutableString1)
        myMutableString.append(myMutableString2)
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: myMutableString.length))
        return myMutableString
    }
    
}
