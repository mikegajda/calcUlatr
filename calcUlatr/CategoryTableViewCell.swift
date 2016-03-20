//
//  CategoryTableViewCell.swift
//  calcUlatr
//
//  Created by Tyrone Hou on 3/20/16.
//  Copyright © 2016 Preference Digital. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    // MARK: Properties

    @IBOutlet weak var CategoryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
