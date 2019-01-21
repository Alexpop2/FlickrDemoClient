//
//  PhotoInfoPresenter.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

class PhotoInfoPresenter {
    private weak var view: PhotoInfoViewInput!
    private var interactor: PhotoInfoInteractorInput!
    private var presenterDelegate: PhotoInfoPresenterDelegate!
}

extension PhotoInfoPresenter: PhotoInfoPresenterInput {
    var delegate: PhotoInfoPresenterDelegate {
        get {
            return presenterDelegate
        }
        set {
            presenterDelegate = newValue
        }
    }
    var viewInput: PhotoInfoViewInput {
        get {
            return view
        }
        set {
            view = newValue
        }
    }
    
    var interactorInput: PhotoInfoInteractorInput {
        get {
            return interactor
        }
        set {
            interactor = newValue
        }
    }
}

extension PhotoInfoPresenter: PhotoInfoViewOutput {
    func loadPhotoInfo() {
        interactor.updatePhotoInfo()
    }
    func favouriteButtonClick() {
        interactor.favouriteButtonClick()
    }
}

extension PhotoInfoPresenter: PhotoInfoInteractorOutput {
    func updateFavourite(id: String, favourite: Bool) {
        view.setFavouriteIcon(flag: favourite)
        presenterDelegate.updateFavourite(id: id, favourite: favourite)
    }
    
    func setPhotoInfo(title: String, url: URL, imgHeight: String, imgWidth: String, favourite: Bool) {
        view.set(title: title)
        view.set(image: url, imgHeight: imgHeight, imgWidth: imgWidth)
        view.setFavouriteIcon(flag: favourite)
    }
}
