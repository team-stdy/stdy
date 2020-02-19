//
//  EditEventViewController.swift
//  Synapse
//
//  Created by Olivia Tanzman on 2/17/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

//
//  CreateEvent.swift
//  Synapse
//
//  Created by Olivia Tanzman on 2/13/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class EditEventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

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
        
       
            
        }

        //7 rows of information
         func numberOfSections(in tableView: UITableView) -> Int {
               return 7
           }
           
            //Table
           func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return currentEventsArray[section].sectionEvents.count
           }
    
        //Table Section Header
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            let label = UILabel(frame: CGRect(x: 15, y: 5, width: 265, height: 449))
            
            label.text = eventsArray[section].sectionHeader
            view.backgroundColor = UIColor(hexString: "6200EE")
            label.textColor = UIColor.white
            
            label.font = UIFont(name: "Helvetica Neue", size: 20)
            view.addSubview(label)
            return view
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
            
            //Change the names of these labels to reflect the new content they hold (i.e. the header is the
            //  class instead of the purpose, the the place where the date was now holds the purpose)
            cell.classLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].classCode
            cell.descriptionLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].purpose
            cell.timeLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].time
            cell.locationLabel.text = eventsArray[indexPath.section].sectionEvents[indexPath.row].location
            cell.rsvpLabel.text = "RSVP Count: " + String(eventsArray[indexPath.section].sectionEvents[indexPath.row].rsvpCount)
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        }
        

}
