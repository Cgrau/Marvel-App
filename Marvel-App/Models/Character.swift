//
//  Character.swift
//  Marvel-App
//
//  Created by Carles Grau Galvan on 11/05/2018.
//  Copyright © 2018 Carles Grau Galvan. All rights reserved.
//

import Foundation

struct ServiceResponse<T:Decodable>: Decodable {
    let status, copyright, attributionText: String?
    let code: Int?
    let attributionHTML: String?
    let data: DataClass<T>?
    let etag: String?
}

struct DataClass<T:Decodable>: Decodable {
    let offset, limit, total, count: Int?
    let results: [T]?
}

struct Character: Decodable {
    var id: Int?
    var name: String = ""
    var description: String = ""
    var modified: String = ""
    var thumbnail: Thumbnail?
    var resourceURI: String = ""
    var comics: Resources?
    var series: Resources?
    var stories: Resources?
    var events: Resources?
    var urls: [urlData] = []

    private enum CodingKeys: String, CodingKey {
        case id, name, description, modified, thumbnail, resourceURI, comics, series, stories, events
    }
}

struct Thumbnail: Decodable {
    var path: String = ""
    var thumbnailExtension: String = ""

    private enum CodingKeys: String, CodingKey {
        case path = "path"
        case thumbnailExtension = "extension"
    }
}

struct Resources: Decodable {
    var available: Int = 0
    var collectionURI: String = ""
    var items: [Item] = []
    var returned: Int = 0
}

struct Item: Decodable {
    var resourceURI: String = ""
    var name: String = ""
    var thumbnail: Thumbnail?
}

struct urlData: Decodable {
    var type: String = ""
    var url: String = ""
}

//struct ServiceResponse: Codable {
//    let code, status, copyright, attributionText: String?
//    let attributionHTML: String?
//    let data: DataClass?
//    let etag: String?
//}
//
//struct DataClass: Codable {
//    let offset, limit, total, count: String?
//    let results: [Character]?
//}
//
//struct Character: Codable {
//    let id, name, description, modified: String?
//    let resourceURI: String?
//    let urls: [URL]?
//    let thumbnail: Thumbnail?
//    let comics: Comics?
//    let stories: Stories?
//    let events, series: Comics?
//}
//
//struct Comics: Codable {
//    let available, returned, collectionURI: String?
//    let items: [Item]?
//}
//
//struct Stories: Codable {
//    let available, returned, collectionURI: String?
//    let items: [Item]?
//}
//
//struct Item: Codable {
//    let resourceURI, name, type: String?
//}
//
//struct Thumbnail: Codable {
//    let path, thumbnailExtension: String?
//
//    enum CodingKeys: String, CodingKey {
//        case path
//        case thumbnailExtension = "extension"
//    }
//}
//
//struct URI: Codable {
//    let type, url: String?
//}
