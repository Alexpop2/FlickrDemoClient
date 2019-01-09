//
//  PhotoInfoInteractorProtocols.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol PhotoInfoInteractorInput: class {
    var output: PhotoInfoInteractorOutput { get set }
    var galleryItem: GalleryItem { get set }
    func updatePhotoInfo()
}

protocol PhotoInfoInteractorOutput: class {
    func setPhotoInfo(title: String, url: URL)
}
