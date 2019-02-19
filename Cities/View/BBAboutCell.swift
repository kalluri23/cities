//
//  BBAboutCell.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/18/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import UIKit

class BBAboutCell: UITableViewCell {

    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var fieldValue: UILabel!
    
    func configure(withField name: String, value: String) {
        fieldLabel.text = name
        fieldValue.text = value
    }

}
