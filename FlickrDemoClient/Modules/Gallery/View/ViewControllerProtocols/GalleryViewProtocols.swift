//
//  GalleryViewProtocols.swift
//  FlickrDemoClient
//
//  Created by Igor on 06/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol GalleryViewInput: class {
    var presenterInput: GalleryPresenterInput { get set }
    func display(galleryItems: [GalleryItem])
}
