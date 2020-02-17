//
//  AllisonViewController.swift
//  Synapse
//
//  Created by Zack Noble on 1/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class AllClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, TableViewNew {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var coursesArray = [Course]()
    var currentCoursesArray = [Course]()
    
//    var newCourseName = ""
//    var newCourseTeacher = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCourses()
        setUpSearchBar()
        // alterLayout()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
    }
    
    
    private func setUpCourses() {
        coursesArray.append(Course(course: "AADS 1010", teacher: "Taffe"))
        coursesArray.append(Course(course: "AMER 1002", teacher: "Jacobs"))
        coursesArray.append(Course(course: "AMER 3200", teacher: "Torres Colon"))
        coursesArray.append(Course(course: "ANTH 1301", teacher: "Tung"))
        coursesArray.append(Course(course: "ANT 2160W", teacher: "Erbel"))
        coursesArray.append(Course(course: "ARTS 1001", teacher: "Warren"))
        coursesArray.append(Course(course: "ARTS 1300", teacher: "Cusomato"))
        coursesArray.append(Course(course: "ARTS 1700", teacher: "Warren"))
        coursesArray.append(Course(course: "ARTS 2500", teacher: "Ziegler"))
        coursesArray.append(Course(course: "ASIA 2302", teacher: "Chaudhry"))
        coursesArray.append(Course(course: "ASIA 2630 ", teacher: "Rogaski"))
        coursesArray.append(Course(course: "ASTR 1010", teacher: "Weintraub"))
        coursesArray.append(Course(course: "ASTR 2130", teacher: "Weintraub"))
        coursesArray.append(Course(course: "BSCI 1100", teacher: "Woelfle"))
        coursesArray.append(Course(course: "BME 1015", teacher: "Del Bosque"))
        coursesArray.append(Course(course: "BSCI 1100", teacher: "Woelfle"))
        coursesArray.append(Course(course: "BME 1015", teacher: "Del Bosque"))
        coursesArray.append(Course(course: "BME 2002", teacher: "Anderson"))
        coursesArray.append(Course(course: "BME 2002", teacher: "Lowery"))
        coursesArray.append(Course(course: "BME 3890", teacher: "Bowden"))
        coursesArray.append(Course(course: "CHBE 2200", teacher: "Laibinis"))
        coursesArray.append(Course(course: "CE 2200", teacher: "Statics"))
        coursesArray.append(Course(course: "CS 1101", teacher: "Arena"))
        coursesArray.append(Course(course: "CS 1151", teacher: "Turner"))
        coursesArray.append(Course(course: "CS 1151", teacher: "Singh"))
        coursesArray.append(Course(course: "CS 2201", teacher: "Roth"))
        coursesArray.append(Course(course: "CS 2201", teacher: "Fisher"))
        coursesArray.append(Course(course: "MATH 2300", teacher: "Ahner"))
        coursesArray.append(Course(course: "MATH 2300", teacher: "Medri"))
        coursesArray.append(Course(course: "MATH 2600", teacher: "Suvaina"))
        coursesArray.append(Course(course: "MATH 2600", teacher: "Mark"))
//        coursesArray.append(Course(course: newCourseName, teacher: newCourseTeacher))
        
        currentCoursesArray = coursesArray
        
    }
    
    private func setUpSearchBar(){
        searchBar.delegate = self
    }
    
//    func alterLayout(){
//        tableView.tableHeaderView = UIView()
//        // search bar in navigation bar
//        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
//        navigationItem.titleView = searchBar
//        search.hidesSearchBarWhenScrolling = false // you can show/hide this dependant on your layout
//    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCoursesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableView else {
            return UITableViewCell()
        }
        
        cell.courseLabel.text = currentCoursesArray[indexPath.row].course
        cell.teacherLabel.text = currentCoursesArray[indexPath.row].teacher
        
        cell.setCourse(course: currentCoursesArray[indexPath.row])
        cell.cellDelegate = (self as TableViewNew)
        
        return cell
    }
    

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vcMyClasses = storyboard?.instantiateViewController(identifier: "MyClassesViewController") as? MyClassesViewController
//        
//        let courseName = currentCoursesArray[indexPath.row].course
//        let teacherName = currentCoursesArray[indexPath.row].teacher
//        
//        vcMyClasses?.courseName = courseName
//        vcMyClasses?.courseTeacher = teacherName
//        
//        navigationController?.pushViewController(vcMyClasses!, animated: true)
//    }
    
    
    // This two functions can be used if you want to show the search bar in the section header
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return searchBar
//    }
    
//    // search bar in section header
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
    //Search Bar
    
    // called when text changes (including clear)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            currentCoursesArray = coursesArray
            tableView.reloadData()
            return
            
        }
        currentCoursesArray = coursesArray.filter({ courseNow -> Bool in
            guard let text = searchBar.text else { return false }
            return courseNow.course.localizedCaseInsensitiveContains(text) || courseNow.teacher.localizedCaseInsensitiveContains(text)
        })
        tableView.reloadData()
    }
    
    

//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        // Stop doing the search stuff
//        // and clear the text in the search bar
//        searchBar.text = ""
//        // Hide the cancel button
//        searchBar.showsCancelButton = false
//        // You could also change the position, frame etc of the searchBar
//        // Remove focus from the search bar.
//        searchBar.endEditing(true)
//    }
    
    var clickedPath: IndexPath? = nil
    
    func cellClicked(_ cell: TableView) {
            if let indexPath = self.tableView.indexPath(for: cell) {
            clickedPath = indexPath
            performSegue(withIdentifier: "viewMyClasses", sender: self)
        }
    }
    
    //https://stackoverflow.com/questions/50778968/passing-data-through-tableview-using-the-button-clicked
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewMyClasses" {
            let myClassesVC = segue.destination as! MyClassesViewController
            if let indexPath = clickedPath {
                let selectedIndex = currentCoursesArray[indexPath.row]
                myClassesVC.courseName = selectedIndex.course
                myClassesVC.courseTeacher = selectedIndex.teacher
            }
        }
    }
    
}

class Course {
    let course: String
    let teacher: String
    
    init(course: String, teacher: String) {
        self.course = course
        self.teacher = teacher
    }
}
