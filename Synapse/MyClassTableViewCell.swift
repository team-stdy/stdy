//
//  MyClassTableViewCell.swift
//  Synapse
//
//  Created by Zack Noble on 2/5/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class MyClassTableViewCell: UITableViewCell {
    @IBOutlet weak var teacherLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
