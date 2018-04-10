//
//  Config.swift
//  SecondChance
//
//  Created by macbook on 06/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import Foundation

struct URLS {
    
    //static let main = "secondchance.azurewebsites.net/"
    static let main = "http://192.168.100.46:8080/user/"
    //Post{email,password}
    static let login = main + "login"
    //Post{email,passowrd,firstname,lastname,bithdate}
    static let register = main + "users"
    //Post{id}
    static let getLikeMatchResumeList = main + "likeMatch/getLikeMatchResumeList"
    //Post{sourceUserId,targetUserId}
    static let getMessageList = main + "message/getMessageList"
}
