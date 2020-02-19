//
//  CreateEvent.swift
//  Synapse
//
//  Created by Olivia Tanzman on 2/13/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    private var datePicker: UIDatePicker?
    
    private var timePicker: UIDatePicker?
    
    @IBOutlet weak var classNameTextField: UITextField!
    
    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add a date to the date textfield here
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(CreateEventViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
        dateTextField.inputView = datePicker
        
        // add a time to the time textfield here
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        timePicker?.addTarget(self, action: #selector(CreateEventViewController.timeChanged(timePicker:)), for: .valueChanged)
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(CreateEventViewController.viewTapped1(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture1)
        
        timeTextField.inputView = timePicker
    
        configureTextFields()
    }
    //function when the date function is clicked on
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    //function for when the date is changed
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        dateTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    //function when the time function is clicked on
    @objc func viewTapped1(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    //function for when the time is changed
    @objc func timeChanged(timePicker: UIDatePicker) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:MM"
        
        timeTextField.text = timeFormatter.string(from: timePicker.date)
        view.endEditing(true)
    }
    
    //configure the textfields
    private func configureTextFields() {
        classNameTextField.delegate = self
        eventNameTextField.delegate = self
        descriptionTextField.delegate = self
        dateTextField.delegate = self
        timeTextField.delegate = self
        durationTextField.delegate = self
        locationTextField.delegate = self
    }
    
    //make sure that the user taps within the textfields
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self , action: #selector(CreateEventViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    //when they click the create button
    @IBAction func CreateTapped(_ sender: Any) {
    
         let vcMyEvents = storyboard?.instantiateViewController(identifier: "ClassEventViewController") as? ClassEventViewController
                                    
    
        vcMyEvents?.courseName  = classNameTextField.text!
        vcMyEvents?.purpose = descriptionTextField.text!
        vcMyEvents?.date=dateTextField.text!
        vcMyEvents?.time=timeTextField.text!
        vcMyEvents?.classCode=classNameTextField.text!
        vcMyEvents?.location=locationTextField.text!
        vcMyEvents?.rsvp=1
        
        navigationController?.pushViewController(vcMyEvents!, animated: true)
     
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
extension CreateEventViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

