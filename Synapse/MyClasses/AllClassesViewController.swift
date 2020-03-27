//
//  AllisonViewController.swift
//  Synapse
//
//  Created by Zack Noble on 1/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class AllClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, TableViewNew {
    
    //HOLDS ALL THE DATA
    //NEED THIS IN EVERY FILE THAT ACCESSES USERS, EVENTS, OR COURSES
    let masterData = MasterData()
    
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
        for courseObject in masterData.getCourses(){
            coursesArray.append(courseObject);
        }
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
        
        cell.courseLabel.text = currentCoursesArray[indexPath.row].courseCode
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
            return courseNow.courseCode.localizedCaseInsensitiveContains(text) || courseNow.teacher.localizedCaseInsensitiveContains(text)
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
                myClassesVC.courseName = selectedIndex.courseCode
                myClassesVC.courseTeacher = selectedIndex.teacher
            }
        }
    }
    
}
