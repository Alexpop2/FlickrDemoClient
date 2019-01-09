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
}

extension PhotoInfoInteractor: PhotoInfoInteractorInput {
    var output: PhotoInfoInteractorOutput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}
