//
//  GabiZackViewController.swift
//  Synapse
//
//  Created by Gabi Gresenz on 1/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class MyClassesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var courses = [Course]()
    
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
        myCoursesArray.append(Course(course: "MATH 1011", teacher: "Stalin"))
        myCoursesArray.append(Course(course: "ARTS 2349", teacher: "Zedong"))
        myCoursesArray.append(Course(course: "CS 3493", teacher: "Mussolini"))
        myCoursesArray.append(Course(course: "SOC 1930", teacher: "Churchill"))
        myCoursesArray.append(Course(course: "MGMT 3401", teacher: "Il Sung"))
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

        vcClassEvents?.courseName = courseName!
        vcClassEvents?.courseTeacher = teacherName!
        
        navigationController?.pushViewController(vcClassEvents!, animated: true)
    }
    
// https://www.udemy.com/course/instagram-clone-w-swift-4-firebase-and-push-notifications/learn/lecture/10411698#questions
//    func fetchClasses(){
//        Database.database().reference().child("courses").observe(.childAdded){ (snapshot) in
//            
//            // uid
//            let uid = snapshot.key
//
//            //snapshot value cast as dictionary
//            guard let dictionary = snapshot.value as? Dictionary<String, AnyObject> else {return}
//                        
//            //construct user
//            let course = Course(uid: uid, dictionary: dictionary)
//            
//            self.courses.append(course)
//            
//            self.tableView.reloadData()
//            
//        }
//        
//    }
}

