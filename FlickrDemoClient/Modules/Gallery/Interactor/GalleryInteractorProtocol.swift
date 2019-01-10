//
//  GalleryInteractorProtocol.swift
//  FlickrDemoClient
//
//  Created by Igor on 05/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol GalleryInteractorInput: class {
    var output: GalleryInteractorOutput { get set }
    func updateImages()
    func operateWithFavourite(id: String, status: Bool)
}

protocol GalleryInteractorOutput: class {
    func setDataSource(parsedInput: FlickrResponse, favouriteList: [String])
}
