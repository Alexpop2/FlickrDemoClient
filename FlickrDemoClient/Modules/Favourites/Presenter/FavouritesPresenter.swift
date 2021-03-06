//
//  FavouritesPresenter.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

class FavouritesPresenter {
    private weak var presenterDelegate: FavouritesPresenterDelegate!
    private weak var view: FavouritesViewInput!
    private var interactor: FavouritesInteractorInput!
}

extension FavouritesPresenter: FavouritesPresenterInput {
    
    var delegate: FavouritesPresenterDelegate {
        get {
            return presenterDelegate
        }
        set {
            presenterDelegate = newValue
        }
    }
    
    var viewInput: FavouritesViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: FavouritesInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}

extension FavouritesPresenter: FavouritesViewOutput {
    func loadPictures() {
        interactor.updateImages()
    }
    
    func tableRowClick(post: GalleryItem) {
        delegate.showPostDetails(post: post)
    }
}

extension FavouritesPresenter: FavouritesInteractorOutput {
    func setDataSource(items: [GalleryItem], favouriteList: [String]) {
        var favouriteItemList = [PostEntity]()
        for item in items {
            let favourite = favouriteList.contains(item.id)
            if(favourite) {
                let favouriteItem = PostEntity()
                favouriteItem.id = item.id
                favouriteItem.title = item.title
                favouriteItem.url = item.url.absoluteString
                favouriteItem.imgHeight = item.imgHeight
                favouriteItem.imgWidth = item.imgWidth
                favouriteItemList.append(favouriteItem)
            }
        }
        //interactor.addFavouritesToDB(items: favouriteItemList)
        view.display(galleryItems: items)
    }
}
