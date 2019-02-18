//
//  BBCitiesListViewModel.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/17/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import UIKit

class BBCitiesListViewModel: NSObject {

    var cities: [BBCity]?
    var matchingCities: [BBCity]?
    
    var reloadData: (() -> Void)? //Block to reload collection view
    var reloadDetailData: (() -> Void)? //Block to reload Detail View controller
    
    var numberOfSections: Int {
        return 1
    }
    
    var numberOfRows: Int {
        
        guard let cities = self.matchingCities else {
            return 0
        }
        return cities.count
    }
    
    /** Make API call and get list of Cities
     */
    func fetchCities() {
        loadCities(completion: { [unowned self] (isSuccess, citiesList) in
            if isSuccess, let cities = citiesList {
                self.cities = cities
                self.matchingCities = cities
                self.reloadData?()
                self.reloadDetailData?()
            }
        })
    }
    
    func cityAtIndex(index: Int) -> BBCity {
        guard let cities = self.matchingCities else {
            assert(false, "Cities list is empty")
        }
        return cities[index]
    }
    
    /** Search Cities from previously fetched list
     */
    func searchCities(matching string: String? = nil) {
        guard let matchingString = string else {
            self.matchingCities = self.cities
            self.reloadData?()
            return
        }
        let matchingCities = self.cities?.filter({(aCity) in
            
            if aCity.name.lowercased().contains(matchingString.lowercased()) {
                return true
            }else {
                return false
            }
        })
        self.matchingCities = matchingCities
        self.reloadData?()
    }
}
