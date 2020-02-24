//
//  User.swift
//  Synapse
//
//  Created by Gabi Gresenz on 2/23/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

class User{
    var username: String
    var email: String
    var university: String
    var courses: [Course]
    // var pic: UIImage

    init(username: String, email: String, university: String){
        self.username = username
        self.email = email
        self.university = university
        self.courses = [Course]()
        //self.pic = pic
    }
}
