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
    func setGalleryItem(item: GalleryItem) {
        self.item = item
        //updatePhotoInfo()
    }
    
    func favouriteButtonClick() {
        let postEntity = PostEntity()
        postEntity.id = item.id
        postEntity.title = item.title
        postEntity.url = item.url.absoluteString
        postEntity.imgHeight = item.imgHeight
        postEntity.imgWidth = item.imgWidth
        if(item.favouriteIcon) {
            item.favouriteIcon = false
            database.deleteEntity(galleryItem: postEntity)
        } else {
            item.favouriteIcon = true
            database.addEntity(galleryItem: postEntity)
        }
        presenter.updateFavourite(id: item.id, favourite: item.favouriteIcon)
    }
    
    func updatePhotoInfo() {
        presenter.setPhotoInfo(title: item.title,
                               url: item.imageUrl,
                               imgHeight: item.imgHeight,
                               imgWidth: item.imgWidth,
                               favourite: item.favouriteIcon)
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
