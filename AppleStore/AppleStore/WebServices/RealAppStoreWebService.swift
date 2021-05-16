//
//  RealAppStoreWebService.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import Foundation

struct RealAppStoreWebService: AppStoreWebService {
    
    func fetchAppStoreData(completion: (Array<AppStorePresentationModel>) -> Void) {
        loadAppStoreData { (models) in
            completion(models)
        }
    }
    
    private func loadAppStoreData(onLoad: (Array<AppStorePresentationModel>) -> Void) {
        let iBooks = Bundle.main
            .url(forResource: RealAppStoreWebService.iBooks, withExtension: RealAppStoreWebService.json)
            .flatMap { try? Data(contentsOf: $0) }
        let iosapps = Bundle.main
            .url(forResource: RealAppStoreWebService.iosapps, withExtension: RealAppStoreWebService.json)
            .flatMap { try? Data(contentsOf: $0) }
        let applemusic = Bundle.main
            .url(forResource: RealAppStoreWebService.applemusic, withExtension: RealAppStoreWebService.json)
            .flatMap { try? Data(contentsOf: $0) }
        let itunesmusic = Bundle.main
            .url(forResource: RealAppStoreWebService.itunesmusic, withExtension: RealAppStoreWebService.json)
            .flatMap { try? Data(contentsOf: $0) }
        let itunesu = Bundle.main
            .url(forResource: RealAppStoreWebService.itunesu, withExtension: RealAppStoreWebService.json)
            .flatMap { try? Data(contentsOf: $0) }
        let podcasts = Bundle.main
            .url(forResource: RealAppStoreWebService.podcasts, withExtension: RealAppStoreWebService.json)
            .flatMap { try? Data(contentsOf: $0) }
        
        if let iBooksData = iBooks,
           let iosappsData = iosapps,
           let applemusicData = applemusic,
           let itunesmusicData = itunesmusic,
           let itunesuData = itunesu,
           let podcastsData = podcasts {
            do {
                let iBooks = try JSONDecoder().decode(AppStore.self, from: iBooksData)
                let iBooksGenres: Array<Genre> = iBooks.feed.results.flatMap { $0.genres }.unique
                let iBooksGenresPresentationModels: Array<GenrePresentationModel> = iBooksGenres.map { genre in
                    genre.fromData(genre)
                }
                
                let iosapps = try JSONDecoder().decode(AppStore.self, from: iosappsData)
                let iosappsGenres: Array<Genre> = iosapps.feed.results.flatMap { $0.genres }.unique
                let iosappsGenresPresentationModels: Array<GenrePresentationModel> = iosappsGenres.map { genre in
                    genre.fromData(genre)
                }
                
                let applemusic = try JSONDecoder().decode(AppStore.self, from: applemusicData)
                let applemusicGenres: Array<Genre> = applemusic.feed.results.flatMap { $0.genres }.unique
                let applemusicGenresPresentationModels: Array<GenrePresentationModel> = applemusicGenres.map { genre in
                    genre.fromData(genre)
                }
                
                let itunesmusic = try JSONDecoder().decode(AppStore.self, from: itunesmusicData)
                let itunesmusicGenres: Array<Genre> = itunesmusic.feed.results.flatMap { $0.genres }.unique
                let itunesmusicGenresPresentationModels: Array<GenrePresentationModel> = itunesmusicGenres.map { genre in
                    genre.fromData(genre)
                }
                
                let itunesu = try JSONDecoder().decode(AppStore.self, from: itunesuData)
                let itunesuGenres: Array<Genre> = itunesu.feed.results.flatMap { $0.genres }.unique
                let itunesuGenresPresentationModels: Array<GenrePresentationModel> = itunesuGenres.map { genre in
                    genre.fromData(genre)
                }
                
                let podcasts = try JSONDecoder().decode(AppStore.self, from: podcastsData)
                let podcastsGenres: Array<Genre> = podcasts.feed.results.flatMap { $0.genres }.unique
                let podcastsGenresPresentationModels: Array<GenrePresentationModel> = podcastsGenres.map { genre in
                    genre.fromData(genre)
                }
                
                var arrContents = Array<AppStorePresentationModel>()
                arrContents.append(AppStorePresentationModel(title: iBooks.feed.title ?? "",
                                                             icon: iBooks.feed.icon,
                                                             isExpanded: false,
                                                             results: iBooks.feed.results,
                                                             type: .iBooks,
                                                             genres: iBooksGenresPresentationModels))
                arrContents.append(AppStorePresentationModel(title: iosapps.feed.title ?? "",
                                                             icon: iosapps.feed.icon,
                                                             isExpanded: false,
                                                             results: iosapps.feed.results,
                                                             type: .iosApps,
                                                             genres: iosappsGenresPresentationModels))
                arrContents.append(AppStorePresentationModel(title: applemusic.feed.title ?? "",
                                                             icon: applemusic.feed.icon,
                                                             isExpanded: false,
                                                             results: applemusic.feed.results,
                                                             type: .appleMusic,
                                                             genres: applemusicGenresPresentationModels))
                arrContents.append(AppStorePresentationModel(title: itunesmusic.feed.title ?? "",
                                                             icon: itunesmusic.feed.icon,
                                                             isExpanded: false,
                                                             results: itunesmusic.feed.results,
                                                             type: .itunesMusic,
                                                             genres: itunesmusicGenresPresentationModels))
                arrContents.append(AppStorePresentationModel(title: itunesu.feed.title ?? "",
                                                             icon: itunesu.feed.icon,
                                                             isExpanded: false,
                                                             results: itunesu.feed.results,
                                                             type: .itunesU,
                                                             genres: itunesuGenresPresentationModels))
                arrContents.append(AppStorePresentationModel(title: podcasts.feed.title ?? "",
                                                             icon: podcasts.feed.icon,
                                                             isExpanded: false,
                                                             results: podcasts.feed.results,
                                                             type: .podcasts,
                                                             genres: podcastsGenresPresentationModels))
                onLoad(arrContents)
            }catch let decodeError {
                print("decode error \(decodeError)")
            }
        }
    }
    
    private static let iBooks = "ibooks"
    private static let iosapps = "iosapps"
    private static let applemusic = "applemusic"
    private static let itunesmusic = "itunesmusic"
    private static let itunesu = "itunesu"
    private static let podcasts = "podcasts"
    private static let json = "json"
}
