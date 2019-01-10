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
    private weak var coordinator: GalleryPresenterOutput!
}

// MARK: - GalleryPresenterInput protocol implementation

extension GalleryPresenter: GalleryPresenterInput {
    var output: GalleryPresenterOutput {
        get {
            return coordinator
        }
        set {
            coordinator = newValue
        }
    }
    
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
        interactor.loadFavourites()
        interactor.updateImages()
    }
}

// MARK: - GalleryInteractorOutput protocol implementation

extension GalleryPresenter: GalleryInteractorOutput {
    func setDataSource(parsedInput: FlickrResponse, favouriteList: [String]) {
        var outArray = [GalleryItem]()
        var favouriteItemList = [PostEntity]()
        guard let photosArray = parsedInput.photos?.photo else { return }
        for item in photosArray {
            let id = item.id
            let title = item.title
            let pictureURL = item.url_l
            let favourite = favouriteList.contains(id)
            let galleryItem = GalleryItem(id: id,
                                          name: title,
                                          url: pictureURL,
                                          imgHeight: item.height_l,
                                          imgWidth: item.width_l,
                                          favouriteIcon: favourite)
            outArray.append(galleryItem)
            if(favourite) {
                let favouriteItem = PostEntity()
                favouriteItem.id = id
                favouriteItem.title = title
                favouriteItem.url = item.url_l.absoluteString
                favouriteItem.imgHeight = item.height_l
                favouriteItem.imgWidth = item.width_l
                favouriteItemList.append(favouriteItem)
            }
        }
        interactor.addFavouritesToDB(items: favouriteItemList)
        view.display(galleryItems: outArray)
    }
}
