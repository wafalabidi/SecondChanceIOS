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
    var name: String
    var lastName: String
    var university: String
    var descriptionUser : String
    var profession : String
    var numberOfChildren: Int
    var gender: String
    var status : String
    var email: String
    var country: String
    var town : String
    var id: Int
    var profilePic: String
    var liveAlone: Bool
    var age : Int
    

    
    //MARK: Inits
    
    init(json: Dictionary<String,Any>?) {
        
        guard let dict = json,
            let id = dict["id"] as? Int,
            let age = dict["age"] as? Int,
            let email = dict["email"] as? String,
            let name = dict["name"] as? String,
            let lastname = dict["lastName"] as? String,
            let description = dict["description"] as? String,
            let university = dict["university"] as? String,
            let profession = dict["profession"] as? String,
            let status = dict["status"] as? String,
            let numberOfChildren = dict["numberOfChildren"] as? Int,
            let country = dict["country"] as? String,
            let town = dict["town"] as? String,
            let livesAlone = dict["livesAlone"] as? Bool,
            let pictures = dict["pictures"] as? String,
            let gender = dict["gender"] as? String

            
            else {fatalError() }
        
        self.id = id
        self.age = age
        self.email = email
        self.name = name
        self.lastName = lastname
        self.gender = gender
        self.descriptionUser = description
        self.university = university
        self.profession = profession
        self.status = status
        self.numberOfChildren = numberOfChildren
        self.country = country
        self.town = town
        self.liveAlone = livesAlone
        self.profilePic = pictures
        
        
    }
}
