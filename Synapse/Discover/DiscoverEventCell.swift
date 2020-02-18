
//
//  SpecificEventCell.swift
//  Synapse
//
//  Created by Neil Dan on 2/17/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class DiscoverEventCell: UITableViewCell {

  
    
    //@IBOutlet weak var UserProfilePic: UIImageView!
    
    @IBOutlet weak var UserUsernameLabel: UILabel!
    
    func setCell(user: User)
    {
        //UserProfilePic.image = user.pic
        UserUsernameLabel.text = user.username
    }
}
