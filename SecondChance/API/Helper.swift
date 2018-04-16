//
//  Helper.swift
//  SecondChance
//
//  Created by macbook on 10/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    
    class func saveUserId(id:Int) {
        
        let defaultUser = UserDefaults.standard
        defaultUser.setValue(id, forKey: "id")
        defaultUser.synchronize()
        
    }
    class func getId() -> Int? {
        let defaultUser = UserDefaults.standard
        return defaultUser.object(forKey: "id") as? Int
    }
}

