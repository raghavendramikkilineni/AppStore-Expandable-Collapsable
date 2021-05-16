//
//  Array+Extentions.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 16/05/21.
//

import Foundation

//MARK: Array Extention
extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        return uniqueValues
    }
}
