
import UIKit
class LikeMatchResume {
    
    //MARK: Properties
    var id: Int = 0
    var name: String = ""
    var lastMessage: String = ""
    var lastMessageSender: Bool = false
    var nbrUnseenMessages: Int = 0
    var photo : UIImage?
    
    //MARK: Inits
    init(){}
    
    init(id: Int, name: String, lastMessage: String, lastMessageSender: Bool, nbrUnseenMessages: Int, photo: UIImage?) {
        self.id = id
        self.name = name
        self.lastMessage = lastMessage
        self.lastMessageSender = lastMessageSender
        self.nbrUnseenMessages = nbrUnseenMessages
        self.photo = photo
    }
    
    
    
}
