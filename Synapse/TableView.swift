//
//  TableView.swift
//  Synapse
//
//  Created by Allison Trager on 1/29/20.
//  Copyright © 2020 Synapse. All rights reserved.
//

import UIKit

class TableView: UITableViewCell {

    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
