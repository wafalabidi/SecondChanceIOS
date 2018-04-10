
import UIKit
import ObjectMapper
class LikeMatchResume:Mappable {
    
    //MARK: Properties
    var id: Int = 0
    var name: String = ""
    var lastMessage: String = ""
    var lastMessageSender: Bool = false
    var nbrUnseenMessages: Int = 0
    var photo : UIImage?
    
    //MARK: Inits
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        lastMessage <- map["lastMessage"]
        lastMessageSender <- map["lastMessageSender"]
        nbrUnseenMessages <- map["nbrUnseenMessages"]
        photo <- map["photo"]
    }
    
    init(id: Int, name: String, lastMessage: String, lastMessageSender: Bool, nbrUnseenMessages: Int, photo: UIImage?) {
        self.id = id
        self.name = name
        self.lastMessage = lastMessage
        self.lastMessageSender = lastMessageSender
        self.nbrUnseenMessages = nbrUnseenMessages
        self.photo = photo
    }
    
    
    
}
