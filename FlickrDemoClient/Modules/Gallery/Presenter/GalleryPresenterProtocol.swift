//
//  GalleryPresenterProtocol.swift
//  FlickrDemoClient
//
//  Created by Igor on 05/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol GalleryPresenterInput: class {
    var viewInput: GalleryViewInput { get set }
    var interactorInput: GalleryInteractorInput { get set }
    var delegate: GalleryPresenterDelegate { get set }
    
    func operateWithFavourite(id: String, status: Bool)
}

protocol GalleryPresenterDelegate: class {
    func showPostDetails(post: GalleryItem)
}
