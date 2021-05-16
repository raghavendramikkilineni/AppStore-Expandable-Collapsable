//
//  AppStoreViewModel.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import Foundation

extension AppStoreView {
    class AppStoreViewModel: ObservableObject {
        @Published var appStore: AppStore?
        @Published var appStorePresentationModels: Array<AppStorePresentationModel> = Array<AppStorePresentationModel>()
        
        init() {
            loadAppStoreData()
        }
        
        func loadAppStoreData() {
            RealAppStoreWebService().fetchAppStoreData { (models) in
                appStorePresentationModels = models
            }
        }
    }
}
