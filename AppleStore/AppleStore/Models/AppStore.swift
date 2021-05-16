//
//  AppStore.swift
//  AppleStore
//
//  Created by Raghavendra Mikkilineni on 14/05/21.
//

import Foundation

//MARK: App Store
struct AppStore: Codable {
    var feed: Feed
}

//MARK: Feed
struct Feed: Codable {
    let title: String?
    let appid: String?
    let author: Author
    let links: Array<Link>
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    var results: Array<Result>
    
    enum CodingKeys: String, CodingKey {
        case appid = "id"
        case title, copyright, country, icon, updated
        case author
        case links
        case results
    }
}

//MARK: Author
struct Author: Codable {
    let name: String
    let uri: String
    
    enum CodingKeys: String, CodingKey {
        case name, uri
    }
}

//MARK: Link
struct Link: Codable {
    let selfLink : String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case alternate
    }
}

//MARK: Result
struct Result: Codable {
    let artistName: String
    let resultId: String
    let releaseDate: String
    let name: String
    let kind: String
    let artistId: String?
    let artistUrl: String?
    let artworkUrl100: String
    var genres: Array<Genre>
    let url: String
    let copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case resultId = "id"
        case releaseDate, name, kind, artistId, artistUrl, artworkUrl100
        case genres
        case url
        case copyright
    }
}

//MARK: Genre
struct Genre: Codable, Equatable {
    let genreId: String
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case genreId, name, url
    }
}
