//
//  DiscoverClassesViewController.swift
//  Synapse
//
//  Created by Allison Trager on 2/10/20.
//  Copyright © 2020 Synapse. All rights reserved.
//


//Header link: https://www.youtube.com/watch?v=zFMSovtqqUc
//Create table link: https://www.youtube.com/watch?v=4RyhnwIRjpA&t=1206s

import UIKit

class ClassEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
//    struct Events {
//        var sectionHeader: String!
//        var sectionEvents = [Event]()
//    }

//    var eventsArray = [Events]()
//    var currentEventsArray = [Events]()

    var courseName = ""
    var courseTeacher = ""

    var eventsArray = [Event]()
    var currentEventsArray = [Event]()


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpEvents()
    }

//    private func setUpEvents(){
//        eventsArray = [Events(sectionHeader: "CS 1101", sectionEvents:[
//        Event(purpose: "Go over homework 1", date: "10/10/20", time: "10:00 AM"),
//        Event(purpose: "Study for test", date: "10/11/20", time: "10:00 AM"),
//        Event(purpose: "Work on programming assignment 4 with study team", date: "10/12/20", time: "10:00 AM"),
//        Event(purpose: "Go to office hours", date: "10/13/20", time: "10:00 AM"),
//        Event(purpose: "Make studyguide", date: "10/16/20", time: "10:00 AM"),
//        Event(purpose: "Quiz each other with flashcards", date: "10/17/20", time: "10:00 AM")
//        ]),
//
//        Events(sectionHeader: "MATH 2300", sectionEvents:[
//        Event(purpose: "Go over homework 1", date: "10/10/20", time: "10:00 AM"),
//        Event(purpose: "Study for test", date: "10/11/20", time: "10:00 AM"),
//        Event(purpose: "Work on programming assignment 4 with study team", date: "10/12/20", time: "10:00 AM"),
//        Event(purpose: "Go to office hours", date: "10/13/20", time: "10:00 AM"),
//        Event(purpose: "Make studyguide", date: "10/16/20", time: "10:00 AM"),
//        Event(purpose: "Quiz each other with flashcards", date: "10/17/20", time: "10:00 AM")
//        ]),
//
//        Events(sectionHeader: "EECE 2116", sectionEvents:[
//        Event(purpose: "Go over homework 1", date: "10/10/20", time: "10:00 AM"),
//        Event(purpose: "Study for test", date: "10/11/20", time: "10:00 AM"),
//        Event(purpose: "Work on programming assignment 4 with study team", date: "10/12/20", time: "10:00 AM"),
//        Event(purpose: "Go to office hours", date: "10/13/20", time: "10:00 AM"),
//        Event(purpose: "Make studyguide", date: "10/16/20", time: "10:00 AM"),
//        Event(purpose: "Quiz each other with flashcards", date: "10/17/20", time: "10:00 AM")
//        ])]
//
//        currentEventsArray = eventsArray
//
//    }

    private func setUpEvents() {
        eventsArray.append(Event(purpose: "Go over homework 1", date: "10/10/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Study for test", date: "10/11/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Work on programming assignment 4 with study team", date: "10/12/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Go to office hours", date: "10/13/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Go over homework 5", date: "10/14/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Check answers for problem set", date: "10/15/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Make studyguide", date: "10/16/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Quiz each other with flashcards", date: "10/17/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Rehearse lines", date: "10/18/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Review and edit essays", date: "10/19/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Go over homework 11", date: "10/20/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Study for test 2", date: "10/21/20", time: "10:00 AM"))
        eventsArray.append(Event(purpose: "Go over review sheet", date: "10/10/20", time: "10:00 AM"))

        currentEventsArray = eventsArray
    }


    //Table Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))

        label.text = "Course"
        view.backgroundColor = UIColor(hexString: "6200EE")
        label.textColor = UIColor.white

        label.font = UIFont(name: "Avenir", size: 16)
        view.addSubview(label)
        return view
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentEventsArray.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell") as? ClassEventsTableViewCell else {
            return UITableViewCell()
        }

        cell.RSVPButton.layer.cornerRadius = 10
        cell.RSVPButton.layer.shadowColor = UIColor.black.cgColor
        cell.RSVPButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cell.RSVPButton.layer.shadowRadius = 4
        cell.RSVPButton.layer.shadowOpacity = 0.5
        cell.RSVPButton.layer.masksToBounds = false

        cell.purposeLabel.text = eventsArray[indexPath.section].purpose
        cell.dateLabel.text = eventsArray[indexPath.section].date
        cell.timeLabel.text = eventsArray[indexPath.section].time


        return cell
    }


}
