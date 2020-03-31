//
//  MasterData.swift
//  Synapse
//
//  Created by Gabi Gresenz on 3/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

class MasterData{
    var courses: [Course]
    var users: [User]
    var events: [Event]
    
    var currentUser: User
    
    init(){
        self.courses = [Course]()
        self.users = [User]()
        self.events = [Event]()
        self.currentUser = User(username: "You", email: "current@user.com", university: "Vanderbilt")
        
        initUsers()
        initCourses()
        initEvents()
        initCurrentUser()
    }
    
    func initCurrentUser(){
        currentUser.addCourse(c: self.courses[10])
        currentUser.addCourse(c: self.courses[15])
        currentUser.addCourse(c: self.courses[20])
        currentUser.addCourse(c: self.courses[25])
        currentUser.addCourse(c: self.courses[5])
    }
    
    func initUsers(){
        users.append(User(username: "Neil Dan", email: "indra.n.dan@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Allison Trager", email: "allsion@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Bob Smith", email: "indra.n.dan@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Mary Joe", email: "gabi@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Tom Brown", email: "allsion@vanderbilt.edu", university: "Vanderbilt"))
        users.append(currentUser)
        users.append(User(username: "Sydney Lee", email: "sydney@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Susan Silverman", email: "susan@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Ben Gold", email: "ben@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Gabi Gresenz", email: "gabi@vanderbilt.edu", university: "Vanderbilt"))
        users.append(User(username: "Olivia Tanzman", email: "olivia@vanderbilt.edu", university: "Vanderbilt"))
    }
    
    func initEvents(){
        //Set-up Events
        let date1 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
        
        //Calculate the Date objects for the next week
        let date2 = date1.addingTimeInterval(86400);
        let date3 = date2.addingTimeInterval(86400);
        let date4 = date3.addingTimeInterval(86400);
        let date5 = date4.addingTimeInterval(86400);
        let date6 = date5.addingTimeInterval(86400);
        let date7 = date6.addingTimeInterval(86400);
        
        events.append(Event(purpose: "Go over homework 1", date: date4.addingTimeInterval(43200), location: "Featheringhill Atrium", course: courses[0]));
        events.append(Event(purpose: "Study for test", date: date3.addingTimeInterval(36000), location: "Buttrick", course: courses[0]));
        events.append(Event(purpose: "Work on assignment 4", date: date6.addingTimeInterval(52200), location: "Stevenson 1", course: courses[0]));
        events.append(Event(purpose: "Go to office hours", date: date7.addingTimeInterval(72000), location: "Rand", course: courses[5]));
        events.append(Event(purpose: "Make studyguide", date: date2.addingTimeInterval(75600), location: "Stevenson", course: courses[5]));
        events.append(Event(purpose: "Quiz each other with flashcards", date: date6.addingTimeInterval(36000), location: "Grins", course: courses[5]));
        events.append(Event(purpose: "Go over homework 1", date: date2.addingTimeInterval(52200), location: "Featheringill 120", course: courses[10]));
        events.append(Event(purpose: "Study for test", date: date4.addingTimeInterval(63000), location: "Stevenson Library", course: courses[10]));
        events.append(Event(purpose: "Go over homework 1", date: date5.addingTimeInterval(43200), location: "Rand", course: courses[15]));
        events.append(Event(purpose: "Study for Exam 2", date: date1.addingTimeInterval(72000), location: "Buttrick", course: courses[15]));
        events.append(Event(purpose: "Go over homework 1", date: date3.addingTimeInterval(52200), location: "Lupton Lounge", course: courses[20]));
        events.append(Event(purpose: "Review session for quiz", date: date1.addingTimeInterval(52200), location: "Calhoun", course: courses[20]));
        events.append(Event(purpose: "Go to office hours", date: date7.addingTimeInterval(72000), location: "North House", course: courses[25]));
        events.append(Event(purpose: "Make studyguide", date: date3.addingTimeInterval(36000), location: "Kissam", course: courses[25]));
        events.append(Event(purpose: "Practice problems", date: date4.addingTimeInterval(63000), location: "Bronson", course: courses[30]));
        
        //Hashing function to pick a random number of users attending the Event
        //  based on event index in the event array.
        //This is to ensure that a specific event's number of users does not
        //  change throughout the program.
        for i in 0...events.count - 1{
            var numUsers = i % users.count;
            //To avoid the case where 0 users are initialized to the Event
            //  when numUsers = 0 is generated, change it instead to 5
            if(numUsers == 0){
                numUsers += 5;
            }
            
            for j in 0...numUsers{
                events[i].addUser(user: users[j]);
            }
        }
    }
    
    func initCourses(){
        courses.append(Course(course: "AADS 1010", teacher: "Taffe"))
        courses.append(Course(course: "AMER 1002", teacher: "Jacobs"))
        courses.append(Course(course: "AMER 3200", teacher: "Torres Colon"))
        courses.append(Course(course: "ANTH 1301", teacher: "Tung"))
        courses.append(Course(course: "ANT 2160W", teacher: "Erbel"))
        courses.append(Course(course: "ARTS 1001", teacher: "Warren"))
        courses.append(Course(course: "ARTS 1300", teacher: "Cusomato"))
        courses.append(Course(course: "ARTS 1700", teacher: "Warren"))
        courses.append(Course(course: "ARTS 2500", teacher: "Ziegler"))
        courses.append(Course(course: "ASIA 2302", teacher: "Chaudhry"))
        courses.append(Course(course: "ASIA 2630 ", teacher: "Rogaski"))
        courses.append(Course(course: "ASTR 1010", teacher: "Weintraub"))
        courses.append(Course(course: "ASTR 2130", teacher: "Weintraub"))
        courses.append(Course(course: "BSCI 1100", teacher: "Woelfle"))
        courses.append(Course(course: "BME 1015", teacher: "Del Bosque"))
        courses.append(Course(course: "BSCI 1100", teacher: "Woelfle"))
        courses.append(Course(course: "BME 1015", teacher: "Del Bosque"))
        courses.append(Course(course: "BME 2002", teacher: "Anderson"))
        courses.append(Course(course: "BME 2002", teacher: "Lowery"))
        courses.append(Course(course: "BME 3890", teacher: "Bowden"))
        courses.append(Course(course: "CHBE 2200", teacher: "Laibinis"))
        courses.append(Course(course: "CE 2200", teacher: "Statics"))
        courses.append(Course(course: "CS 1101", teacher: "Arena"))
        courses.append(Course(course: "CS 1151", teacher: "Turner"))
        courses.append(Course(course: "CS 1151", teacher: "Singh"))
        courses.append(Course(course: "CS 2201", teacher: "Roth"))
        courses.append(Course(course: "CS 2201", teacher: "Fisher"))
        courses.append(Course(course: "MATH 2300", teacher: "Ahner"))
        courses.append(Course(course: "MATH 2300", teacher: "Medri"))
        courses.append(Course(course: "MATH 2600", teacher: "Suvaina"))
        courses.append(Course(course: "MATH 2600", teacher: "Mark"))
    }
    
    func getUsers() -> [User]{
        return self.users;
    }
    
    func getEvents() -> [Event]{
        return self.events;
    }
    
    func getCourses() -> [Course]{
        return self.courses;
    }
}
