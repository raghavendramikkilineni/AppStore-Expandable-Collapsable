//
//  AppStoreWebService.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import Foundation

protocol AppStoreWebService {
    func fetchAppStoreData(completion: (Array<AppStorePresentationModel>) -> Void)
}
