//
//  DatabaseServiceProtocols.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol DatabaseServiceInput {
    func loadEntites() -> [PostEntity]
    func saveEntites(data: [PostEntity])
    func addEntity(galleryItem: PostEntity)
    func deleteEntity(galleryItem: PostEntity)
}


