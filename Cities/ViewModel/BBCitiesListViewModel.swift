//
//  BBCitiesListViewModel.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/17/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import UIKit

class BBCitiesListViewModel: NSObject {

    override init() {
        super.init()
        fetchCities()
    }
    
    /** Make API call and get list of characters
     */
    func fetchCities() {
        loadCities(completion: { (isSuccess, citiesList) in
            if isSuccess, let cities = citiesList {
                print(cities.count)
            }
        })
    }
}
