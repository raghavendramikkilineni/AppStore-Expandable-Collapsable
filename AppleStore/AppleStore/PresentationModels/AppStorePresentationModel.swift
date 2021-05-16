//
//  AppStorePresentationModel.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 16/05/21.
//

import Foundation

enum AppStoreType {
    case iBooks
    case iosApps
    case appleMusic
    case itunesMusic
    case itunesU
    case podcasts
}

//MARK: AppStore Presentation Model
struct AppStorePresentationModel {
    let title: String
    let icon: String
    var isExpanded: Bool = false
    var results: Array<Result>
    let type: AppStoreType
    var genres: Array<GenrePresentationModel>
}

//MARK: GenrePresentationModel
struct GenrePresentationModel: Equatable {
    let genreId: String
    let name: String
    let url: String
    var isExpanded: Bool = false
}

extension Genre {
    func fromData(_ genre: Genre) -> GenrePresentationModel {
        return GenrePresentationModel(genreId: genre.genreId,
                                      name: genre.name,
                                      url: genre.url,
                                      isExpanded: false)
    }
}
