 //
 //  API.swift
 //  SecondChance
 //
 //  Created by macbook on 14/03/2018.
 //  Copyright © 2018 Wafe. All rights reserved.
 //
 
 import UIKit
 import Alamofire
 import SwiftyJSON
 
 
 class API: NSObject {
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        let url = URLS.login
        
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
                    let json = JSON(value)
                    if let id = json["id"].int{
                        print("id: \(id)")
                        //Save id
                        Helper.saveUserId(id: id)
                        completion(nil, true)
                    }
                }
        }
    }
    
    class func register(firstname: String,lastname: String,email: String, password: String,birthdate: String,username: String,completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        
        let url = URLS.register
        
        let parameters  = [
            "firstName": firstname,
            "lastName": lastname,
            "email": email,
            "password": password,
            "birthDate": birthdate,
            "username": username
            
            ] as [String : Any]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result
                {
                case . failure(let error):
                    completion(error,false)
                    print(error)
                case .success(let value):
                    let json = JSON(value)
                    if let id = json["id"].int{
                        print("id: \(id)")
                        //Save id
                        Helper.saveUserId(id: id)
                        completion(nil, true)
                    }
                    
                }
                
        }
        
    }
    
    class func editUser(id:Int,university:String,profession:String,description:String, completion: @escaping (_ error: Error?, _ success: Bool)->Void)  {
        
        let url = URLS.updateUser
        
        let parameters: [String: Any] = [
            "id": id,
            "university": university,
            "profession": profession,
            "description": description
            
            
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                
                switch response.result
                {
                case . failure(let error):
                    completion(error,false)
                    print(error)
                case .success(let value):
                    _ = JSON(value)
                    completion(nil,true)
                    
                    
                }
                
        }
    }
    
    
    class func getUserFilter(id: Int ,completion: @escaping (_ error: Error?, _ temps:[User]?)->Void) {
        
        
        let url = URLS.getFilterUser
        
        
        let parameters: [String:AnyObject] = [
            "id" : id as AnyObject ,
            
            ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                switch response.result
                {
                case . failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    print(value)
                    guard value is [[String: Any]] else {
                        completion(nil, nil)
                        print("psika psika")
                        return
                    }
                    let temps = [User]()
                    completion(nil,temps)
                    
                }
        }
    }
    
    
    class func
        createPhoto(photo: UIImage, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let url = URLS.uploadPhoto
        
        
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            
            if let data = UIImageJPEGRepresentation(photo, 0.5) {
                form.append(data, withName: "file", fileName: "photo.jpeg", mimeType: "image/jpeg")
                
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: .post,headers: nil) { (result: SessionManager.MultipartFormDataEncodingResult) in
            
            switch result {
            case .failure(let error):
                print(error)
                completion(error, false)
                
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                
                upload.uploadProgress(closure: { (progress: Progress) in
                    print(progress)
                })
                    .responseJSON(completionHandler: { (response: DataResponse<Any>) in
                        
                        switch response.result
                        {
                        case .failure(let error):
                            print(error)
                            completion(error, false)
                            
                        case .success(let value):
                            let json = JSON(value)
                            print(json)
                            
                            
                        }
                        
                    })
            }
            
        }
        
    }
    
    class func editFilter(gender:String,minAge:Int,maxAge:Int,country:String,town:String,hasChildre:Bool,statusList:[String],relationshipTypeList:[String],livesAlone:Bool, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let url = URLS.updateFilters
        let parameters: [String : Any] = [
            "gender": gender,
            "minAge": minAge,
            "maxAge": maxAge,
            "country": country,
            "town": town,
            "hasChildren": hasChildre,
            "statusList": statusList,
            "relationshipTypeList": relationshipTypeList,
            "livesAlone" : false,
            "appUser": ["id": 1]
        ]
        
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: nil)
            .validate(statusCode: 200..<500)
            .responseString { response in
                switch response.result
                {
                case .failure(let error):
                    completion(error,false)
                    print(error)
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    
                }
        }
    }
    
    
    class func editUserInfo(description:String,university:String,work:String,country:String,town:String,numberOfChild:Int,status:String,age:Int,gender:String,liveAlone:Bool ,completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let url = URLS.updateUser
        
        
        let parameters: [String: Any] = [
            "id": Helper.getId() ?? 0,
            "description": description,
            "university": university,
            "profession": work,
            "numberOfChildren": numberOfChild,
            "age": age,
            "gender": gender,
            "status": status,
            "country": country,
            "town": town,
            "livesAlone":liveAlone
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .responseString { response in
                
                
                Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: nil)
                    .validate(statusCode: 200..<500)
                    .responseString { response in
                        switch response.result
                        {
                        case .failure(let error):
                            completion(error,false)
                            print(error)
                        case .success(let value):
                            let json = JSON(value)
                            print(json)
                            
                        }
                }
                
        }
    }
    
    
    class func getUSerInfo(completion: @escaping (_ cycle:(Filters))->Void) {
        
        
        let url = URLS.getFilters
        
        let parameters = [
            "id" : Helper.getId() ?? 0,
            
            ]
        
        Alamofire.request(url,method: .post, parameters: parameters, encoding : JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600)
            .responseJSON { reponse in
                switch reponse.result
                {
                case . failure(let error):
                    completion(error as! Filters)
                    print(error)
                case .success(let value):
                    print(value)
                    completion(Filters(json: value as? Dictionary<String, Any>))
                    
                    
                }
        }
    }
    
    class func photos(page: Int = 1, completion: @escaping (_ error: Error?, _ photos: [Photo]?)->Void) {
        
        guard let id = Helper.getId() else {
            completion(nil, nil)
            return
        }
        let parameters = [
            
            "appUser": ["id": id]

        ]
        
        let url = URLS.getPicProfile
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            switch response.result
            {
            case .failure(let error):
                print(error)
                completion(error, nil)
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
            }
            
        }
    }
    
 }
 
