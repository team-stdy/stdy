//
//  Course.swift
//  Synapse
//
//  Created by Gabi Gresenz on 2/23/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

class Course {
    let courseCode: String
    let teacher: String
    let section: String
    let university: String
    
    init(course: String, teacher: String) {
        self.courseCode = course
        self.teacher = teacher
        self.section = "00"
        self.university = "Vanderbilt"
    }
}
