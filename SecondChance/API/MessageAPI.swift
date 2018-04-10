 import Alamofire
 import SwiftyJSON
 import UIKit
 import Foundation
 import AlamofireObjectMapper
 
 class MessageAPI: NSObject {
    
    
    class func getMessages (targetUserId: Int,sourceUserId: Int,completion: @escaping (_ error: Error?, _ messages:[Message]?)->Void) {
        let url = URLS.getMessageList
        
        let parameters: [String: Any] = [
            "sourceUser" : [
                "id" : 1
            ],
            "targetUser" : [
                "id" : 3
            ]
        ]
        
        print("***********************************MessageList")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseArray { (response: DataResponse<[Message]>) in
            
            let messages = response.result.value
            
            completion(nil,messages)
        }
    }
 }
 
