






import ObjectMapper

class Message:Mappable {
    //MARK: Properties
    var id: Int = 0
    var sendingDate: Date = Date()
    var text: String = ""
    var seeingDate: Date = Date()
    var isSeen: Bool = false
    var sourceUser: User?
    var targetUser: User?
    var isSender: Bool = false
    
    //MARK: Inits
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        sendingDate <- (map["sendingDate"], DateTransform())
        text <- map["text"]
        seeingDate <- (map["seeingDate"], DateTransform())
        isSeen <- map["seen"]
        sourceUser <- map["sourceUser"]
        targetUser <- map["targetUser"]
        isSender <- map["sender"]
    }
    
    init(id: Int, sendingDate: Date, text: String, seeingDate: Date, isSeen: Bool, sourceUser: User, targetUser: User, isSender: Bool) {
        self.id = id
        self.sendingDate = sendingDate
        self.text = text
        self.seeingDate = seeingDate
        self.isSeen = isSeen
        self.sourceUser = sourceUser
        self.targetUser = targetUser
        self.isSender = isSender
    }
    
    
    
    
}
