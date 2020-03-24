//
//  Course.swift
//  Synapse
//
//  Created by Gabi Gresenz on 2/23/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import Firebase

class Course {
    var courseCode: String!
    var teacher: String!
    var section: String!
    var university: String!
    var user: User?
    
    init(course: String, teacher: String) {
        self.courseCode = course
        self.teacher = teacher
        self.section = "00"
        self.university = "Vanderbilt"
    }
    
//    init(user: User, dictionary: Dictionary<String, AnyObject>) {
//
//        self.user = user
//
//        if let uid = dictionary["uid"] as? String {
//            self.uid = uid
//        }
//
//        if let courseCode = dictionary["courseCode"] as? String {
//            self.courseCode = courseCode
//        }
//
//        if let teacher = dictionary["teacher"] as? String {
//            self.teacher = teacher
//        }
//
//        if let section = dictionary["section"] as? String {
//            self.section = section
//        }
//
//        //not sure about this part
//        self.university = user.university
//
//    }
}
