//
//  DiscoverClassesViewController.swift
//  Synapse
//
//  Created by Allison Trager on 2/10/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class DiscoverClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {


    @IBOutlet weak var searchBar: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    var eventsArray = [Event]()
    var currentEventsArray = [Event]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpEvents()
        setUpSearchBar()
    }
    

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
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    //Table Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor(hexString: "6200EE")
        label.textColor = UIColor.white
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
     //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentEventsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? DiscoverTableViewCell else {
            return UITableViewCell()
        }
        
        cell.RSVPButton.layer.cornerRadius = 10
        cell.RSVPButton.layer.shadowColor = UIColor.black.cgColor
        cell.RSVPButton.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        cell.RSVPButton.layer.shadowRadius = 4
        cell.RSVPButton.layer.shadowOpacity = 0.5
        cell.RSVPButton.layer.masksToBounds = false
        
        cell.purposeLabel.text = eventsArray[indexPath.row].purpose
        cell.dateLabel.text = eventsArray[indexPath.row].date
        cell.timeLabel.text = eventsArray[indexPath.row].time
        
        return cell
    }
    
    //Search Bar
    // called when text changes (including clear)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            currentEventsArray = eventsArray
            tableView.reloadData()
            return
            
        }
        currentEventsArray = eventsArray.filter({ eventNow -> Bool in
            guard let text = searchBar.text else { return false }
            return eventNow.purpose.localizedCaseInsensitiveContains(text)
        })
        tableView.reloadData()
    }
}

class Event {
    let purpose: String
    let date: String //may need to change later to accomodate dates
    let time: String //may need to change later to accomodate dates
    
    init(purpose: String, date: String, time: String) {
        self.purpose = purpose
        self.date = date
        self.time = time
    }
}
