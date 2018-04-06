//
//  User.swift
//  SecondChance
//
//  Created by macbook on 02/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class User: NSObject {
    
    //MARK: Properties
    let name: String
    let email: String
    let id: String
    var profilePic: UIImage
    
    //MARK: Inits
    init(name: String, email: String, id: String, profilePic: UIImage) {
        self.name = name
        self.email = email
        self.id = id
        self.profilePic = profilePic
    }
}
