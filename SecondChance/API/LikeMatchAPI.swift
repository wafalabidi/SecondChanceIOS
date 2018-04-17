 import Alamofire
 import SwiftyJSON
 import UIKit
 import Foundation
 import AlamofireObjectMapper
 
 class LikeMatchAPI: NSObject {
    
    
    class func getLikeMatchResume (userId: Int,completion: @escaping (_ error: Error?, _ likeMatchResumes:[LikeMatchResume]?)->Void) {
        let url = URLS.getLikeMatchResumeList
        
        let parameters: [String: Any] = [
            "id" : userId
        ]
        
        print("***********************************LikeMatchResumeList")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseArray { (response: DataResponse<[LikeMatchResume]>) in
            
            let likeMatchResumes = response.result.value
            
            completion(nil,likeMatchResumes)
        }
        
        /*
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON {
                response in
                switch response.result
                {
                case . failure(let error):
                    completion(error,nil)
                    print(error)
                case .success(let value):
                    print(value)
                    
                    
                    guard let dataArr = value as? [[String: Any]] else {
                        completion(nil, nil)
                        print("ERROR")
                        return
                    }
                    
                    
                    var likeMatchResumes = [LikeMatchResume]()
                    
                    for data  in dataArr {
                        let likeMatchResume = LikeMatchResume()
                        likeMatchResume.id = data["id"] as? Int ?? 0
                        likeMatchResume.name = data["name"] as? String ?? ""
                        likeMatchResume.lastMessage = data["lastMessage"] as? String ?? ""
                        likeMatchResume.lastMessageSender = data["lastMessageSender"] as? Bool ?? false
                        likeMatchResume.nbrUnseenMessages = data["nbrUnseenMessages"] as? Int ?? 0
                        
                        likeMatchResumes.append(likeMatchResume)
                        
                    }
                    completion(nil,likeMatchResumes)
                }
        }
        */
    }
 }
