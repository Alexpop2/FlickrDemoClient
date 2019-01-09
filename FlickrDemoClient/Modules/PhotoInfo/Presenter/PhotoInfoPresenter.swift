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
}

extension PhotoInfoPresenter: PhotoInfoPresenterInput {
    func updatePhotoInfo() {
        interactor.updatePhotoInfo()
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

extension PhotoInfoPresenter: PhotoInfoInteractorOutput {
    func setPhotoInfo(title: String, url: URL, imgHeight: String, imgWidth: String) {
        view.set(title: title)
        view.set(image: url, imgHeight: imgHeight, imgWidth: imgWidth)
    }
}
