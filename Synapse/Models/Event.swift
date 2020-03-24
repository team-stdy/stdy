//
//  Event.swift
//  Synapse
//
//  Created by Gabi Gresenz on 2/23/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

class Event {
    var course: Course
    let users: [User]
    let rsvpCount: Int
//    let creator: User
    
    let purpose: String
    let date: Date  //holds the date and time. Use timeFormatter to display time, dateFormatter to display date
    let location: String
    
    init(purpose: String, date: Date, location: String) {
        self.course = Course(course: "AADS 1010", teacher: "Taffe");    //When we have actual Courses, this will be course object
        self.users = [User]();
        self.rsvpCount = Int.random(in: 0 ... 30);  //When we have a user list, we will change this to length(users)
//        self.creator = User(username: "gabigresenz", email: "gabriela.r.gresenz@vanderbilt.edu", university: "Vanderbilt");  //When we have User objects, this will be the user that made the event (and can edit the event)
        
        self.purpose = purpose
        self.date = date
        self.location = location
    }
    
    public func assignRandomCourse(){
        let c1 = Course(course: "AADS 1010", teacher: "Taffe");
        let c2 = Course(course: "AMER 1002", teacher: "Jacobs");
        let c3 = Course(course: "AMER 3200", teacher: "Torres Colon");
        let c4 = Course(course: "ANTH 1301", teacher: "Tung");
        let c5 = Course(course: "ANT 2160W", teacher: "Erbel");
        let c6 = Course(course: "ARTS 1001", teacher: "Warren");
        let c7 = Course(course: "ARTS 1300", teacher: "Cusomato");
        let c8 = Course(course: "ARTS 1700", teacher: "Warren");
        let c9 = Course(course: "ARTS 2500", teacher: "Ziegler");
        let c10 = Course(course: "ASIA 2302", teacher: "Chaudhry");
        let c11 = Course(course: "ASIA 2630 ", teacher: "Rogaski");
        let c12 = Course(course: "ASTR 1010", teacher: "Weintraub");
        let c13 = Course(course: "ASTR 2130", teacher: "Weintraub");
        let c14 = Course(course: "BSCI 1100", teacher: "Woelfle");
        let c15 = Course(course: "BME 1015", teacher: "Del Bosque");
        let c16 = Course(course: "BSCI 1100", teacher: "Woelfle");
        let c17 = Course(course: "BME 1015", teacher: "Del Bosque");
        let c18 = Course(course: "BME 2002", teacher: "Anderson");
        let c19 = Course(course: "BME 2002", teacher: "Lowery");
        let c20 = Course(course: "BME 3890", teacher: "Bowden");
        let c21 = Course(course: "CHBE 2200", teacher: "Laibinis");
        let c22 = Course(course: "CE 2200", teacher: "Statics");
        let c23 = Course(course: "CS 1101", teacher: "Arena");
        let c24 = Course(course: "CS 1151", teacher: "Turner");
        let c25 = Course(course: "CS 1151", teacher: "Singh");
        let c26 = Course(course: "CS 2201", teacher: "Roth");
        let c27 = Course(course: "CS 2201", teacher: "Fisher");
        let c28 = Course(course: "MATH 2300", teacher: "Ahner");
        let c29 = Course(course: "MATH 2300", teacher: "Medri");
        let c30 = Course(course: "MATH 2600", teacher: "Suvaina");
        let c31 = Course(course: "MATH 2600", teacher: "Mark");
        var coursesArray = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26,  c27, c28, c29, c30, c31];
        self.course = coursesArray.randomElement()!;
        
    }
}
