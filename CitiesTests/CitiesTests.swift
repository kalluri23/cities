//
//  CitiesTests.swift
//  CitiesTests
//
//  Created by Krishna teja Kalluri on 2/19/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import XCTest
@testable import Cities

class CitiesTests: XCTestCase {
    let cityListViewModel = BBCitiesListViewModel()
    
    override func setUp() {
        cityListViewModel.fetchCities()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearchResultsForCityPrefixedA() {
        if let cities =  cityListViewModel.getPrefixMatchingCities(string: "Alb") {
            XCTAssertTrue(cities.count > 0, "There should be atleast one city prefixed with Alb")
        }else {
            XCTFail("There are no cities to test matching prefixes")
        }
    }
    
    func testSearchResultsForCityPrefixedABAB() {
        if let cities =  cityListViewModel.getPrefixMatchingCities(string: "abab") {
            XCTAssertTrue(cities.count == 2, "There should be exactly two results matching this prefix")
        }else {
            XCTFail("There are no cities to test matching prefixes")
        }
    }
    func testSearchResultsForCityPrefixedAl() {
        if let cities =  cityListViewModel.getPrefixMatchingCities(string: "al") {
            XCTAssertTrue(cities.count > 0, "There should be atleast one city prefixed with Al")
        }else {
            XCTFail("There are no cities to test matching prefixes")
        }
    }

}
