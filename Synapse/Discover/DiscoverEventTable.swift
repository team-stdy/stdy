//
//  UsersAttendingEventTable.swift
//  Synapse
//
//  Created by Neil Dan on 2/17/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import Foundation
import UIKit

class DiscoverEventTable: UIViewController{

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var PurposeLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var TitleText = ""
    var PurposeText = ""
    var DateText = ""
    var TimeText = ""
    var LocationText = ""
    
    
    
    var userArray: [User] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        TitleLabel.text = TitleText
        PurposeLabel.text = PurposeText
        DateLabel.text = DateText
        TimeLabel.text = TimeText
        LocationLabel.text = LocationText
        userArray = setUpProfiles()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setUpProfiles() -> [User]{
        var tempUser:[User]  = []
       
        let user1 = User(username: "danin1", email: "indra.n.dan@vanderbilt.edu", university: "Vanderbilt");
        let user2 = User(username: "Gabigre", email: "gabi@vanderbilt.edu", university: "Vanderbilt" );
        let user3 = User(username: "Allison123", email: "allsion@vanderbilt.edu", university: "Vanderbilt" );
        tempUser.append(user1)
        tempUser.append(user2)
        tempUser.append(user3)
        
        return tempUser
    }
           
}

extension DiscoverEventTable: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
               return userArray.count
           }
           
           func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
               let user = userArray[indexPath.row]
               
               let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverEventCell") as! DiscoverEventCell
               
               cell.setCell(user: user)
               
               return cell
           }
}

