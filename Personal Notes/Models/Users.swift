//
//  Users.swift
//  Personal Notes
//
//  Created by SARVADHI on 02/07/23.
//

import Foundation

class Users {
    var userId: String = ""
    var name: String = ""
    var email: String = ""
    var profileImage: String = ""
    
    init(dict: [String: Any]) {
        self.userId = dict["user_id"] as? String ?? ""
        self.name = dict["name"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.profileImage = dict["profile_image"] as? String ?? ""
    }
    
    init(userId: String, name: String, email: String, profileImage: String) {
        self.userId = userId
        self.name = name
        self.email = email
        self.profileImage = profileImage
    }
    
    func toDictionary() -> [String: Any] {
        var dict: [String:Any] = [:]
        dict["user_id"] = self.userId
        dict["name"] = self.name
        dict["email"] = self.email
        dict["profile_image"] = self.profileImage
        return dict
    }
    
}
