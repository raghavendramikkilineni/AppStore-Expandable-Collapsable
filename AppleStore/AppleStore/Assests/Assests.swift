//
//  Assests.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import Foundation
import SwiftUI

struct Assests {
    
    struct Color {
        
    }
    
    struct Font {
        static func displayAll() {
            for family in UIFont.familyNames.sorted() {
                let names = UIFont.fontNames(forFamilyName: family)
                print("Family: \(family) Font names: \(names)")
            }
        }
    }
}

//MARK: Fonts
extension Assests.Font {
    static var avenirBook: String { "Avenir-Book" }
    static var avenirRoman: String { "Avenir-Roman" }
    static var avenirBookOblique: String { "Avenir-BookOblique" }
    static var avenirOblique: String { "Avenir-Oblique" }
    static var avenirLight: String { "Avenir-Light" }
    static var avenirLightOblique: String { "Avenir-LightOblique" }
    static var avenirMedium: String { "Avenir-Medium" }
    static var avenirMediumOblique: String { "Avenir-MediumOblique" }
    static var avenirHeavy: String { "Avenir-Heavy" }
    static var avenirHeavyOblique: String { "Avenir-HeavyOblique" }
    static var avenirBlack: String { "Avenir-Black" }
    static var avenirBlackOblique: String { "Avenir-BlackOblique" }
}

