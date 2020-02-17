//
//  TableView.swift
//  Synapse
//
//  Created by Allison Trager on 1/29/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

protocol TableViewNew {
    func cellClicked(_ cell: TableView)
}

class TableView: UITableViewCell {

    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!


    var cellDelegate: TableViewNew?
    var courseName: String!
    var teacherName: String!
    
    var course: Course!
    
    func setCourse(course: Course) {
        courseLabel.text = course.course
        teacherLabel.text = course.teacher
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        self.cellDelegate!.cellClicked(self)
    }

}
