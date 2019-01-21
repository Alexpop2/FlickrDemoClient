//
//  GalleryViewProtocols.swift
//  FlickrDemoClient
//
//  Created by Igor on 06/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol GalleryViewInput: class {
    var viewOutput: GalleryViewOutput { get set }
    func display(galleryItems: [GalleryItem])
}

protocol GalleryViewOutput: class {
    func loadPictures()
    func tableRowClick(post: GalleryItem)
}
