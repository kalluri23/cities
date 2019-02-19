//
//  CitiesUITests.swift
//  CitiesUITests
//
//  Created by Krishna teja Kalluri on 2/19/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import XCTest
@testable import Cities

class CitiesUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        app.launch()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /** UI test to test if a city with Label Huzruf is present on initial load */
    func testMasterListUI() {
        let cityLabel = app.staticTexts["Hurzuf,UA"]
        XCTAssertTrue(cityLabel.exists, "Ciy matching Hurzuf, UA is not found on initial load")
    }

}
