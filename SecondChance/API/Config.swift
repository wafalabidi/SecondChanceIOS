//
//  Config.swift
//  SecondChance
//
//  Created by macbook on 06/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import Foundation

struct URLS {
    
    static let main = "http://25.5.159.200:8080/"
    //Post{email,password}
    static let login = main + "user/login"
    //Post{email,passowrd,firstname,lastname,bithdate}
    static let register = main + "/user/register"
    //POST
    static let updateUser = main + "/user/appUser/updateProfile"
    //POST
    static let getFilterUser = main + "/user/notation/getFilteredUsers"
    //POST

    //POST
    static let uploadPhoto = main + "/user/picture/upload"
    //GET
    static let getUserInfo = main + ""

}
