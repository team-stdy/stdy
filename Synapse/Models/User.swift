//
//  User.swift
//  Synapse
//
//  Created by Gabi Gresenz on 2/23/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

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
    
    func getCourses() -> [Course]{
        return courses;
    }
    
    func addCourse(c: Course){
        courses.append(c)
    }
    
    func hasCourse(c1: Course) -> Bool{
        for c2 in courses{
            if(c1.courseCode == c2.courseCode
                && c1.teacher == c2.teacher
                && c1.section == c2.section
                && c1.university == c2.university){
                return true;
            }
        }
        return false;
    }
}

//class User{
//    var username: String
//    var email: String
//    var university: String
//    var courses: [Course]
//    // var pic: UIImage
//
//    init(username: String, email: String, university: String){
//        self.username = username
//        self.email = email
//        self.university = university
//        self.courses = [Course]()
//        //self.pic = pic
//    }
//
//    func getCourses() -> [Course]{
//        return courses;
//    }
//
//    func addCourse(c: Course){
//        courses.append(c)
//    }
//
//    func hasCourse(c1: Course) -> Bool{
//        for c2 in courses{
//            if(c1.courseCode == c2.courseCode
//                && c1.teacher == c2.teacher
//                && c1.section == c2.section
//                && c1.university == c2.university){
//                return true;
//            }
//        }
//        return false;
//    }
//
//}
