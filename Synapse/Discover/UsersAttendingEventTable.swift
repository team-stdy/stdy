//
//  UsersAttendingEventTable.swift
//  Synapse
//
//  Created by Neil Dan on 2/17/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

class UsersAttendingEventTable: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //HOLDS ALL THE DATA
    //NEED THIS IN EVERY FILE THAT ACCESSES USERS, EVENTS, OR COURSES
    let masterData = MasterData()
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var PurposeLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var usersAttending = [User]()
    
    var TitleText = ""
    var PurposeText = ""
    var LocationText = ""
    var TimeText = ""
    var DateText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = TitleText
        PurposeLabel.text = PurposeText
        DateLabel.text = findDateAndUsersFromMasterData()
        TimeLabel.text = TimeText
        LocationLabel.text = LocationText
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //This method has two functionalites. From the passed in data (course, location,
    //  purpose), it identifies the corresponding Event object that originally populated
    //  the cell. It then:
    //  1. Populates the usersAttending array with the user list for that Event
    //  2. Returns the Date from the Event object as a String
    func findDateAndUsersFromMasterData() -> String{
        for eventObject in masterData.getEvents(){
            //Search for the Event matching the passed data
            if(eventObject.course.courseCode == TitleText
                && eventObject.location == LocationText
                && eventObject.purpose == PurposeText){
                
                //1. Populate usersAttending
                for userObject in eventObject.users{
                    usersAttending.append(userObject)
                }
                
                //2. Return the formatted Date string
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none
                dateFormatter.locale = Locale(identifier: "en_US")
                
                return dateFormatter.string(from: eventObject.date)
            }
        }
        return ""
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersAttending.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = usersAttending[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificEventCell") as! SpecificEventCell
        
        cell.setCell(user: user)
        
        return cell
    }
    
    
}



