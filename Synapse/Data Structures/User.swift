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
