//
//  FlickrResponse.swift
//  FlickrDemoClient
//
//  Created by Igor on 04/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

enum CodingKeys: String, CodingKey {
    case url = "url_l"
}

struct Photo: Codable {
    var id: String
    var title: String
    var url_l: URL
}

struct Photos: Codable {
    var page: Int
    var pages: Int
    var photo: [Photo]
}

struct FlickrResponse: Codable {
    var photos: Photos?
    var stat: String?
}
