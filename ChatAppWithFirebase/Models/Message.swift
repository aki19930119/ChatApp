//
//  Message.swift
//  ChatAppWithFirebase
//
//  Created by 柿沼儀揚 on 2020/04/11.
//  Copyright © 2020 柿沼儀揚. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class Message {
    
    let name: String
    let message: String
    let uid: String
    let createdAt: Timestamp
    
    var partnerUser: User?
    
    init(dic: [String: Any]) {
        self.name = dic["name"] as? String ?? ""
        self.message = dic["message"] as? String ?? ""
        self.uid = dic["uid"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
    }
}
