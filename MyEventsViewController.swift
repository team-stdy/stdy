//
//  MyEventsViewController.swift
//  Synapse
//
//  Created by Zack Noble on 2/17/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class MyEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date4, location: "Stevenson"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date3, location: "FGH"));
        receivedEventArray.append(Event(purpose: "Work on programming assignment 4 with study team", date: date6, location: "Normandy"));
        receivedEventArray.append(Event(purpose: "Make studyguide", date: date2, location: "West London"));
        receivedEventArray.append(Event(purpose: "Go over homework 1", date: date5, location: "Trump Tower"));
        receivedEventArray.append(Event(purpose: "Study for test", date: date1, location: "Rand"));
        receivedEventArray.append(Event(purpose: "Quiz each other with flashcards", date: date1, location: "A Mass Grave in France"));
        receivedEventArray.append(Event(purpose: "Go to office hours", date: date7, location: "FGH 323"));
        
        //Current date and time
        
        eventsArray = [Events(sectionHeader: "Today", sectionEvents:[]),
                       Events(sectionHeader: "Tomorrow", sectionEvents:[]),
                       Events(sectionHeader: day3String, sectionEvents:[]),
                       Events(sectionHeader: day4String, sectionEvents:[]),
                       Events(sectionHeader: day5String, sectionEvents:[]),
                       Events(sectionHeader: day6String, sectionEvents:[]),
                       Events(sectionHeader: day7String, sectionEvents:[])];
        
        for eventObject in receivedEventArray {
            eventObject.assignRandomCourse();
            let dt = eventObject.date;
            let diffInDays = Calendar.current.dateComponents([.day], from: date1, to: dt).day;
            eventsArray[diffInDays!].sectionEvents.append(eventObject);
        }
        
        currentEventsArray = eventsArray
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyEventsTableViewCell") as? MyEventsTableViewCell else {
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
        cell.classLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].course.courseCode
        cell.descriptionLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].purpose
        cell.timeLabel.text = timeFormatter.string(from: eventsArray[indexPath.section].sectionEvents[indexPath.row].date)
        cell.locationLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].location
        cell.rsvpLabel.text = "RSVP Count: " + String(eventsArray[indexPath.section].sectionEvents[indexPath.row].rsvpCount)
        cell.accessoryType = .detailDisclosureButton
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcEventDetails = storyboard?.instantiateViewController(identifier: "EventDetailsViewController") as? EventDetailsViewController
        
        navigationController?.pushViewController(vcEventDetails!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            currentEventsArray[indexPath.section].sectionEvents.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let vcEditEvent = storyboard?.instantiateViewController(identifier: "EditEventViewController") as? EditEventViewController
        /*
        let course = currentEventsArray[indexPath.section].sectionEvents[indexPath.row].course
        let purpose = currentEventsArray[indexPath.section].sectionEvents[indexPath.row].purpose
        let date = currentEventsArray[indexPath.section].sectionEvents[indexPath.row].date
        let location = currentEventsArray[indexPath.section].sectionEvents[indexPath.row].location
        */
        vcEditEvent?.classNameTextField?.text = "Class Name"
        vcEditEvent?.eventNameTextField?.text = "Event Name"
        vcEditEvent?.descriptionTextField?.text = "Description"
        vcEditEvent?.dateTextField?.text = "Date"
        vcEditEvent?.timeTextField?.text = "Time"
        vcEditEvent?.durationTextField?.text = "Duration"
        vcEditEvent?.locationTextField?.text = "Location"
        navigationController?.pushViewController(vcEditEvent!, animated: true)
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
