//
//  BBDetailViewModel.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/18/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import UIKit

class BBDetailViewModel: NSObject {
    
    var reloadMap: (() -> Void)?
    var reloadAbout: (() -> Void)?
    
    enum FieldType: Int {
        case name
        case address
        case postalCode
        case city
        case details
    }
    
    var city: BBCity?
    
    var numberOfSections: Int {
        return 1
    }
    
    /** Returns fixed numebr of fields to show detail screen */
    var numberOfRows: Int {
        return 5
    }
    
    override init() {
        super.init()
    }
    
    /** Configures detail screen tableview cells based on city object */
    func configure(cell: BBAboutCell, atIndexPath indexPath: IndexPath) {
        if let field = FieldType(rawValue: indexPath.row), let city = self.city {
            switch field {
            case .name:
                cell.configure(withField: "Name", value: "BackBase")
            case .address:
                cell.configure(withField: "Address", value: "\(city.name), \(city.country)")
            case .postalCode:
                cell.configure(withField: "Postal Code", value: "1088 LL")
            case .city:
                cell.configure(withField: "City", value: city.name)
            case .details:
                cell.configure(withField: "Details", value: "This is BackBase iOS Assignemnt")
            }
        }
    }
    
    /** Refreshes map and drops annotation */
    func updateMap(withCity city: BBCity) {
        self.city = city
        reloadMap?()
    }
    
    /** reloads about tableview and hides map */
    func updateAbout(withCity city: BBCity) {
        self.city = city
        reloadAbout?()
    }
    

}
