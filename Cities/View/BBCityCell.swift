//
//  BBCityCell.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/17/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import UIKit

class BBCityCell: UITableViewCell {

    @IBOutlet weak var cityTitleLabel: UILabel!
    @IBOutlet weak var cityCoordLabel: UILabel!
    
    func configure(withCity city:BBCity) {
        cityTitleLabel.text = city.name + ", " + city.country
        cityCoordLabel.text = "\(city.coord.lat),\(city.coord.lon)"
    }

}
