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
        DateLabel.text = DateText
        TimeLabel.text = TimeText
        LocationLabel.text = LocationText
        tableView.delegate = self
        tableView.dataSource = self
        findUsersFromMasterData()
    }
    
    //Use the Event information passed in to find the actual Event object
    //  in MasterData.
    //This Event object has a list of users attending-- populate usersAttending
    //  with the User objects from this list.
    func findUsersFromMasterData(){
        for eventObject in masterData.getEvents(){
            if(eventObject.course.courseCode == TitleText
                && eventObject.location == LocationText
                && eventObject.purpose == PurposeText){
                for userObject in eventObject.users{
                    usersAttending.append(userObject);
                }
                return;
            }
        }
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



