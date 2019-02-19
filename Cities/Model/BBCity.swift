//
//  BBCity.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/17/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import Foundation

struct BBCoordinate : Codable {
    let lon : Double
    let lat : Double
}

struct BBCity : Codable {
    let country : String
    let name : String
    let coord : BBCoordinate
}

typealias FetchHandler = (Bool, [BBCity]?) -> Void

/** Gets list of cities and parse the data from cities.json file in Data Layer folder
*/
func loadCities(completion: @escaping FetchHandler) {
    guard
        let path = Bundle.main.path(forResource: "cities", ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)),
        let cities = try? JSONDecoder().decode([BBCity].self, from: data)
        else {
            completion(false, nil)
            return
    }
    completion(true, cities)
}
