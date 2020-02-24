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
        //Create a Date with the current calendar date with the time set to midnight
        let date1 = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
        
        //Calculate the Date objects for the next week
        let date2 = date1.addingTimeInterval(86400);
        let date3 = date2.addingTimeInterval(86400);
        let date4 = date3.addingTimeInterval(86400);
        let date5 = date4.addingTimeInterval(86400);
        let date6 = date5.addingTimeInterval(86400);
        let date7 = date6.addingTimeInterval(86400);
        
        //Create Strings for the week's dates
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let day3String = dateFormatter.string(from: date3)
        let day4String = dateFormatter.string(from: date4)
        let day5String = dateFormatter.string(from: date5)
        let day6String = dateFormatter.string(from: date6)
        let day7String = dateFormatter.string(from: date7)
        
        eventsArray = [Events(sectionHeader: "Today", sectionEvents:[]),
                       Events(sectionHeader: "Tomorrow", sectionEvents:[]),
                       Events(sectionHeader: day3String, sectionEvents:[]),
                       Events(sectionHeader: day4String, sectionEvents:[]),
                       Events(sectionHeader: day5String, sectionEvents:[]),
                       Events(sectionHeader: day6String, sectionEvents:[]),
                       Events(sectionHeader: day7String, sectionEvents:[])];
        
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date4, location: "Featheringhill"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date3, location: "Mars"));
        receivedEventArray.append(Event(purpose: "Work on programming assignment 4 with study team", date: date6, location: "Stevenson"));
        receivedEventArray.append(Event(purpose: "Go to office hours", date: date7, location: "Rand"));
        receivedEventArray.append(Event(purpose: "Make studyguide", date: date2, location: "Stevenson"));
        receivedEventArray.append(Event(purpose: "Quiz each other with flashcards", date: date6, location: "MGM Resort & Casino"));
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date2, location: "Disney"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date2, location: "CIA Headquarters"));
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date5, location: "Rand"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date1, location: "Buttrick"));
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date3, location: "Stevenson"));
        receivedEventArray.append(Event(purpose: "Quiz each other with flashcards", date: date1, location: "Calhoun"));
        receivedEventArray.append(Event(purpose: "Go to office hours", date: date7, location: "North House"));
        receivedEventArray.append(Event(purpose: "Make studyguide", date: date3, location: "Stairwell"));
        receivedEventArray.append(Event(purpose: "Quiz each other with flashcards", date: date4, location: "North Korea"));
        
        //Current date and time
        
        for eventObject in receivedEventArray{
            eventObject.assignRandomCourse();
            let dt = eventObject.date;
            let diffInDays = Calendar.current.dateComponents([.day], from: date1, to: dt).day;
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
        
        //Create the DateFormatter for the date field within a table cell
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        timeFormatter.locale = Locale(identifier: "en_US")
        
        //Change the names of these labels to reflect the new content they hold (i.e. the header is the
        //  class instead of the purpose, the the place where the date was now holds the purpose)
        cell.purposeLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].course.courseCode
        cell.dateLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].purpose
        cell.timeLabel.text = timeFormatter.string(from: eventsArray[indexPath.section].sectionEvents[indexPath.row].date)
        
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
