//
//  GabiZackViewController.swift
//  Synapse
//
//  Created by Gabi Gresenz on 1/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class MyClassesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var myCoursesArray = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCourses()
    }
    private func setUpCourses() {
        myCoursesArray.append(Course(course: "MATH 1011", teacher: "Stalin"))
        myCoursesArray.append(Course(course: "ARTS 2349", teacher: "Zedong"))
        myCoursesArray.append(Course(course: "CS 3493", teacher: "Mussolini"))
        myCoursesArray.append(Course(course: "SOC 1930", teacher: "Churchill"))
        myCoursesArray.append(Course(course: "MGMT 3401", teacher: "Il Sung"))
    }
}
extension MyClassesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCoursesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.courseLabel.text = myCoursesArray[indexPath.row].course
        cell.teacherLabel.text = myCoursesArray[indexPath.row].teacher
        
        return cell
    
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myCoursesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

