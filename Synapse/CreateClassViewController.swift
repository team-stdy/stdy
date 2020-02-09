//
//  NeilViewController.swift
//  Synapse
//
//  Created by Zack Noble on 1/27/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class CreateClassViewController: UIViewController {

    @IBOutlet weak var letterCodeTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var sectionTextField: UITextField!
    
    @IBOutlet weak var professorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func createClassClicked(_ sender: Any) {
            let vcMyClasses = storyboard?.instantiateViewController(identifier: "MyClassesViewController") as? MyClassesViewController
            
        //This part does not work, probably needs database to hold backend
//        let vcAllClasses = storyboard?.instantiateViewController(identifier: "AllClassesViewController") as? AllClassesViewController
            
            var courseName = letterCodeTextField.text! + " " + numberTextField.text!
            if(!sectionTextField.text!.isEmpty){
                courseName = courseName + "-" + sectionTextField.text!
            }
            
//            vcAllClasses?.newCourseName = courseName
//            vcAllClasses?.newCourseTeacher = professorTextField.text!
            vcMyClasses?.newCourseName = courseName
            vcMyClasses?.newCourseTeacher = professorTextField.text!
            
            navigationController?.pushViewController(vcMyClasses!, animated: true)
    }

}
