//
//  Filters.swift
//  SecondChance
//
//  Created by macbook on 22/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class Filters: NSObject {
    
    //MARK: Properties
    var ageMax: Int
    var ageMin: Int
    var hasChildren: Bool
//    var gender: (String)
    var status : [String]
    var relationshipType : [String]
    var country: String
    var town : String
    var liveAlone: Bool
    
    
    //MARK: Inits
    
    init(json: Dictionary<String,Any>?) {
        
        guard let dict = json,
        
            let ageMax = dict["maxAge"] as? Int,
            let ageMin = dict["minAge"] as? Int,
            let status = dict["statusList"] as? [String],
            let relationshipType = dict["relationshipTypeList"] as? [String],
            let hasChildren = dict["hasChildren"] as? Bool,
            let town = dict["town"] as? String,
            let country = dict["country"] as? String,
            let livesAlone = dict["livesAlone"] as? Bool

            
            else {fatalError() }
        
        self.relationshipType = relationshipType
        self.ageMax = ageMax
        self.ageMin = ageMin
        self.hasChildren = hasChildren
//        self.gender = gender
        self.status = status
        self.country = country
        self.town = town
        self.liveAlone = livesAlone
        
        
    }
}
