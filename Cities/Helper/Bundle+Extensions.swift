//
//  Bundle+Extensions.swift
//  Cities
//
//  Created by Krishna teja Kalluri on 2/17/19.
//  Copyright © 2019 backbase. All rights reserved.
//

import Foundation

extension Bundle {//Get app display name from info.plist
    class func getAppName() -> String {
        if let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return appName
        }else {
            assertionFailure("Please set the name of the app")
            return ""
        }
    }
    
}
