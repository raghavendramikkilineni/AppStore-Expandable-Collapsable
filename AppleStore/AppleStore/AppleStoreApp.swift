//
//  AppleStoreApp.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import SwiftUI

@main
struct AppleStoreApp: App {
    var body: some Scene {
        WindowGroup {
            AppStoreView(viewModel: AppStoreView.AppStoreViewModel())
        }
    }
}
