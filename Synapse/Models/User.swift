//
//  User.swift
//  Synapse
//
//  Created by Gabi Gresenz on 2/23/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import Firebase

class User{
    var username: String!
    var firstName: String!
    var lastName: String!
    var uid: String!
    var university: String!
    var profileImageUrl: String!
    var courses: [Course]
    // var pic: UIImage

//    init(username: String, email: String, university: String){
//        self.username = username
//        self.university = university
//        self.courses = [Course]()
//        //self.pic = pic
//    }
    
    init(uid: String, dictionary: Dictionary<String, AnyObject>) {
        self.uid = uid

        if let username = dictionary["username"] as? String {
            self.username = username
        }

        if let firstName = dictionary["firstName"] as? String {
            self.firstName = firstName
        }

        if let lastName = dictionary["lastName"] as? String {
            self.lastName = lastName
        }

        if let university = dictionary["university"] as? String {
            self.university = university
        }

        if let profileImageUrl = dictionary["profileImageUrl"] as? String {
            self.profileImageUrl = profileImageUrl
        }

        //this needs to be fixed
        self.courses = [Course]()
    }
}
