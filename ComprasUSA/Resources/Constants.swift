//
//  Constants.swift
//  ComprasUSA
//
//  Created by Maria Eugênia Pereira Teixeira on 22/03/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import Foundation


struct Constants {
    
    struct Settings {
        static var dollarCurrency: String {
            get {
                guard let stringURL = Bundle.main.infoDictionary?["DOLLAR_CURRENCY"] as? String else {
                    fatalError("Set your DOLLAR_CURRENCY on info.plist")
                }
                return stringURL
            }
        }
        
        static var iof: String {
            get {
                guard let stringURL = Bundle.main.infoDictionary?["IOF"] as? String else {
                    fatalError("Set your IOF on info.plist")
                }
                return stringURL
            }
        }
    }
}
