//
//  PhotoInfoInteractor.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

class PhotoInfoInteractor {
    private var presenter: PhotoInfoInteractorOutput!
    var internetService: InternetServiceInput!
    var database: DatabaseServiceInput!
    private var item: GalleryItem!
}

extension PhotoInfoInteractor: PhotoInfoInteractorInput {
    func updatePhotoInfo() {
        presenter.setPhotoInfo(title: item.title, url: item.imageUrl, imgHeight: item.imgHeight, imgWidth: item.imgWidth)
    }
    
    var galleryItem: GalleryItem {
        get {
            return item
        }
        set {
            item = newValue
        }
    }
    
    var output: PhotoInfoInteractorOutput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}
