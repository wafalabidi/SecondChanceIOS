//
//  Conversation.swift
//  SecondChance
//
//  Created by macbook on 02/04/2018.
//  Copyright © 2018 Wafe. All rights reserved.
//

import UIKit

class Conversation {
   
    //MARK: Properties
    let user: User
    var lastMessage: Message
    
    
    //MARK: Inits
    init(user: User, lastMessage: Message) {
        self.user = user
        self.lastMessage = lastMessage
    }
    
}
