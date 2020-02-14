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

class DiscoverClassesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {


    @IBOutlet weak var searchBar: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    struct Events {
        var sectionHeader: String!
        var sectionEvents = [Event]()
    }
    
    var receivedEventArray = [Event]()
    var eventsArray = [Events]()
    var currentEventsArray = [Events]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpEvents()
        setUpSearchBar()
    }
    
    private func setUpEvents(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date1 = formatter.date(from: "2020/02/13")!;
        let date2 = formatter.date(from: "2020/02/14")!;
        let date3 = formatter.date(from: "2020/02/15")!;
        let date4 = formatter.date(from: "2020/02/16")!;
        let date5 = formatter.date(from: "2020/02/17")!;
        let date6 = formatter.date(from: "2020/02/18")!;
        let date7 = formatter.date(from: "2020/02/19")!;
        
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date4, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date3, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Work on programming assignment 4 with study team", date: date6, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Go to office hours", date: date7, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Make studyguide", date: date2, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Quiz each other with flashcards", date: date6, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date2, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date2, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date5, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date1, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date3, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Quiz each other with flashcards", date: date1, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Go to office hours", date: date7, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Make studyguide", date: date3, time: "10:00 AM"));
        receivedEventArray.append(Event(purpose: "Quiz each other with flashcards", date: date4, time: "10:00 AM"));
        
        //Current date and time
        
        eventsArray = [Events(sectionHeader: "Today", sectionEvents:[]),
                       Events(sectionHeader: "Tomorrow", sectionEvents:[]),
                       Events(sectionHeader: "The Day After Tomorrow", sectionEvents:[]),
                       Events(sectionHeader: "The Next Day", sectionEvents:[]),
                       Events(sectionHeader: "New Day", sectionEvents:[]),
                       Events(sectionHeader: "Later Day", sectionEvents:[]),
                       Events(sectionHeader: "Someday", sectionEvents:[])];
        
        let today = Date();
        for eventObject in receivedEventArray{
            let dt = eventObject.date;
            let diffInDays = Calendar.current.dateComponents([.day], from: today, to: dt).day;
            eventsArray[diffInDays!].sectionEvents.append(eventObject);
        }
        
        currentEventsArray = eventsArray
        
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
    
    //Table Section Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let label = UILabel(frame: CGRect(x: 15, y: 5, width: tableView.frame.width, height: 20))
        
        label.text = eventsArray[section].sectionHeader
        view.backgroundColor = UIColor(hexString: "6200EE")
        label.textColor = UIColor.white
        
        label.font = UIFont(name: "Avenir", size: 16)
        view.addSubview(label)
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return currentEventsArray.count
    }
    
     //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentEventsArray[section].sectionEvents.count
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
        
        cell.purposeLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].purpose
        cell.dateLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].date.description
        cell.timeLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].time
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    //Search Bar
    // called when text changes (including clear)
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard !searchText.isEmpty else {
//            currentEventsArray = eventsArray
//            tableView.reloadData()
//            return
//
//        }
//        currentEventsArray = eventsArray.filter({ eventNow -> Bool in
//            guard let text = searchBar.text else { return false }
//            return eventNow.sectionEvents[IndexPath].purpose.localizedCaseInsensitiveContains(text)
//        })
//        tableView.reloadData()
//    }
    
}

class Event {
    let purpose: String
    let date: Date
    let time: String //FIXME
    
    init(purpose: String, date: Date, time: String) {
        self.purpose = purpose
        self.date = date
        self.time = time
    }
}
