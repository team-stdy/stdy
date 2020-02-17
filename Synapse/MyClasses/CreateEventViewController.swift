//
//  CreateEvent.swift
//  Synapse
//
//  Created by Olivia Tanzman on 2/13/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import DateTimePicker
import UIKit

class CreateEventViewController: UIViewController {

    @IBOutlet weak var classNameTextField: UITextField!

    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    private var dpShowDateVisible = false
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    
    }
    private func toggleShowDateDatepicker () {
        dpShowDateVisible = !dpShowDateVisible
    
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
