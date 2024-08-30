//
//  UserInfo.swift
//  YOD
//
//  Created by abc on 11/03/19.
//  Copyright © 2019 mobulous. All rights reserved.
//

import Foundation
import RealmSwift
class UserInfo:Object{
    @objc dynamic var name = String()
    @objc dynamic var email_Id = String()
    @objc dynamic var country_Code = String()
    @objc dynamic var country_Name = String()
    @objc dynamic var phone = String()
    @objc dynamic var user_Id = String()
    @objc dynamic var token = String()
}
