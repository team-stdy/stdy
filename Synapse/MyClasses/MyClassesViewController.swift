//
//  GabiZackViewController.swift
//  Synapse
//
//  Created by Gabi Gresenz on 1/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class MyClassesViewController: UIViewController {
    
    //HOLDS ALL THE DATA
    //NEED THIS IN EVERY FILE THAT ACCESSES USERS, EVENTS, OR COURSES
    let masterData = MasterData()
    
    @IBOutlet weak var tableView: UITableView!
    
    var myCoursesArray = [Course]()
    var newCourseName = ""
    var newCourseTeacher = ""
    
    var courseName = ""
    var courseTeacher = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCourses()
    }
    private func setUpCourses() {
        for courseObject in masterData.currentUser.getCourses(){
            myCoursesArray.append(courseObject)
        }
        myCoursesArray.append(Course(course: courseName, teacher: courseTeacher))
        myCoursesArray.append(Course(course: newCourseName, teacher: newCourseTeacher))
    }
}
extension MyClassesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCoursesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell") as? TableViewCell
            else {
                return UITableViewCell()
        }
        
        cell.courseLabel.text = myCoursesArray[indexPath.row].courseCode
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcClassEvents = storyboard?.instantiateViewController(identifier: "ClassEventViewController") as? ClassEventViewController
        
        let courseName = myCoursesArray[indexPath.row].courseCode
        let teacherName = myCoursesArray[indexPath.row].teacher

        vcClassEvents?.courseName = courseName
        vcClassEvents?.courseTeacher = teacherName
        
        navigationController?.pushViewController(vcClassEvents!, animated: true)
    }
}

