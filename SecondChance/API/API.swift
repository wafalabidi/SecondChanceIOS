//
//  API.swift
//  SecondChance
//
//  Created by macbook on 14/03/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit
import Alamofire

class API {
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        
        let url = "https://monivulation.azurewebsites.net"
        
        let parameters = [
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,false)
                    print(error)
                case .success(let value):
                    print(value)
                    completion(nil,true)
                    
                }
                
        }
        
    }
    
    class func register(firstname: String,lastname: String,email: String, password: String,completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        
        let url = "https://monivulation.azurewebsites.net/users"
        
        let parameters  = [
            "firstName": firstname,
            "lastName": lastname,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseString { response in
                switch response.result
                {
                case . failure(let error):
                    completion(error,false)
                    print(error)
                case .success(let value):
                    print(value)
                    completion(nil,false)
                    
                }
                
        }
        
    }
}

