//
//  CourseTableViewCell.swift
//  calcUlatr
//
//  Created by Mike Gajda on 3/19/16.
//  Copyright © 2016 Preference Digital. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
