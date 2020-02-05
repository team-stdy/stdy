//
//  GabiZackViewController.swift
//  Synapse
//
//  Created by Gabi Gresenz on 1/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class GabiZackViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var myCoursesArray = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCourses()

        // Do any additional setup after loading the view.
    }
    private func setUpCourses() {
        myCoursesArray.append(Course(course: "MATH 1011", teacher: "Stalin"))
        myCoursesArray.append(Course(course: "ARTS 2349", teacher: "Zedong"))
        myCoursesArray.append(Course(course: "CS 3493", teacher: "Mussolini"))
        myCoursesArray.append(Course(course: "SOC 1930", teacher: "Churchill"))
        myCoursesArray.append(Course(course: "MGMT 3401", teacher: "Il Sung"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCoursesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableView else {
            return UITableViewCell()
        }
        
        cell.courseLabel.text = myCoursesArray[indexPath.row].course
        cell.teacherLabel.text = myCoursesArray[indexPath.row].teacher
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class Course {
    let course: String
    let teacher: String
    
    init(course: String, teacher: String) {
        self.course = course
        self.teacher = teacher
    }
}
