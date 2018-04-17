 import Alamofire
 import SwiftyJSON
 import UIKit
 import Foundation
 import AlamofireObjectMapper
 
 class MessageAPI: NSObject {
    
    
    class func getMessages (sourceUserId: Int, targetUserId: Int,completion: @escaping (_ error: Error?, _ messages:[Message]?)->Void) {
        let url = URLS.getMessageList
        
        let parameters: [String: Any] = [
            "sourceUser" : [
                "id" : sourceUserId
            ],
            "targetUser" : [
                "id" : targetUserId
            ]
        ]
        
        print("***********************************MessageList")
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseArray { (response: DataResponse<[Message]>) in
            
            let messages = response.result.value
            
            completion(nil,messages)
        }
    }
    
    class func markMessageListAsSeen (sourceUserId: Int, targetUserId: Int){
        let url = URLS.markMessageListAsSeen
        
        let parameters: [String: Any] = [
            "sourceUser" : [
                "id" : sourceUserId
            ],
            "targetUser" : [
                "id" : targetUserId
            ]
        ]
        print("***********************************MessageListSeen")
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
    }
    
    class func saveNewMessage (text: String,sourceUserId: Int, targetUserId: Int,completion: @escaping(_ error: Error?)->Void ){
        let url = URLS.saveNewMessage
        
        let parameters: [String: Any] = [
            "text" : text,
            "sourceUser" : [
                "id" : sourceUserId
            ],
            "targetUser" : [
                "id" : targetUserId
            ]
        ]
        print("***********************************MessageListSeen")
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (responseData) -> Void in
            completion(nil)
        }
    }
    
 }
 
