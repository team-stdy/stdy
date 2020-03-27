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

    //HOLDS ALL THE DATA
    //NEED THIS IN EVERY FILE THAT ACCESSES USERS, EVENTS, OR COURSES
    let masterData = MasterData()
    
    @IBOutlet weak var searchBar: UITableView!
    @IBOutlet weak var tableView: UITableView!
    
    struct Events {
        var sectionHeader: String!
        var sectionEvents = [Event]()
    }
    
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

        //Go through each event that has been created
        //If the current user has the course tied to the Event, show the Event on the Discover page
        for eventObject in masterData.getEvents(){
            if(masterData.currentUser.hasCourse(c1: eventObject.course)){
                let dt = eventObject.date;
                let diffInDays = Calendar.current.dateComponents([.day], from: date1, to: dt).day;
                eventsArray[diffInDays!].sectionEvents.append(eventObject);
            }
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
    
    var passPurpose = ""
    var passTime = ""
    var passLocation = ""
    var passDate = ""
    var passTitle = ""
    
    @IBAction func passDate(_ sender: Any) {
        performSegue(withIdentifier: "DiscoverEvent", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! DiscoverEventTable
        vc.TitleText = self.passTitle
        vc.PurposeText = self.passPurpose
        vc.DateText = self.passDate
        vc.LocationText = self.passLocation
        vc.TimeText = self.passTime
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? DiscoverTableViewCell else {
            return UITableViewCell()
        }
        
        
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
        let vcEventDetails = storyboard?.instantiateViewController(identifier: "DiscoverEventTable") as? DiscoverEventTable
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.timeStyle = .short
        timeFormatter.locale = Locale(identifier: "en_US")
        passTitle =
            currentEventsArray[indexPath.section].sectionEvents[indexPath.row].course.courseCode
        passPurpose =
            currentEventsArray[indexPath.section].sectionEvents[indexPath.row].purpose
        passTime = timeFormatter.string(from: currentEventsArray[indexPath.section].sectionEvents[indexPath.row].date)
        passDate = timeFormatter.string(from: currentEventsArray[indexPath.section].sectionEvents[indexPath.row].date)
        passLocation =
            currentEventsArray[indexPath.section].sectionEvents[indexPath.row].location
        vcEventDetails?.TitleText = passTitle
        vcEventDetails?.DateText = passDate
        vcEventDetails?.TimeText = passTime
        vcEventDetails?.LocationText = passLocation
        vcEventDetails?.PurposeText = passPurpose
        
        navigationController?.pushViewController(vcEventDetails!, animated: true)

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
