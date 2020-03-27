//
//  DummyViewController.swift
//  Synapse
//
//  Created by Allison Trager on 2/11/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class ClassEventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //HOLDS ALL THE DATA
    //NEED THIS IN EVERY FILE THAT ACCESSES USERS, EVENTS, OR COURSES
    let masterData = MasterData()
    
    @IBOutlet weak var tableView: UITableView!
    
    var courseName = ""
    var courseTeacher = ""

    var eventsArray = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpEvents()
    }
    
    private func setUpEvents() {
        for eventObject in masterData.getEvents(){
            if(eventObject.course.courseCode == courseName
                && eventObject.course.teacher == courseTeacher){
                eventsArray.append(eventObject);
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "classCell") as? ClassEventsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.RSVPButton.layer.cornerRadius = 10
        cell.RSVPButton.layer.shadowColor = UIColor.black.cgColor
        cell.RSVPButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cell.RSVPButton.layer.shadowRadius = 4
        cell.RSVPButton.layer.shadowOpacity = 0.5
        cell.RSVPButton.layer.masksToBounds = false
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        timeFormatter.locale = Locale(identifier: "en_US")
        
        cell.purposeLabel.text = eventsArray[indexPath.row].purpose
        cell.dateLabel.text = dateFormatter.string(from: eventsArray[indexPath.row].date)
        cell.timeLabel.text = timeFormatter.string(from: eventsArray[indexPath.row].date)

        return cell
    }
    
    //Table Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))

        label.text = courseName + " - " + courseTeacher
        view.backgroundColor = UIColor(hexString: "6200EE")
        label.textColor = UIColor.white

        label.font = UIFont(name: "Avenir", size: 16)
        view.addSubview(label)
        return view
    }

}
