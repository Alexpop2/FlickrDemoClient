//
//  GalleryPresenter.swift
//  FlickrDemoClient
//
//  Created by Igor on 04/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - Properties

class GalleryPresenter {
    private weak var view: GalleryViewInput!
    private var interactor: GalleryInteractorInput!
}

// MARK: - GalleryPresenterInput protocol implementation

extension GalleryPresenter: GalleryPresenterInput {
    var viewInput: GalleryViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: GalleryInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
    
    func updatePictures() {
        interactor.updateImages()
    }
}

// MARK: - GalleryInteractorOutput protocol implementation

extension GalleryPresenter: GalleryInteractorOutput {
    func setDataSource(parsedInput: FlickrResponse) {
        var outArray = [GalleryItem]()
        guard let photosArray = parsedInput.photos?.photo else { return }
        for item in photosArray {
            let id = item.id
            let title = item.title
            let pictureURL = item.url_l
            let galleryItem = GalleryItem(id: id, name: title, url: pictureURL, imgHeight: item.height_l, imgWidth: item.width_l)
            outArray.append(galleryItem)
        }
        view.display(galleryItems: outArray)
    }
}
