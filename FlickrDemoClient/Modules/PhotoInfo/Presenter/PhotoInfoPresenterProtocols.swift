//
//  PhotoInfoPresenterProtocols.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol PhotoInfoPresenterInput: class {
    var viewInput: PhotoInfoViewInput { get set }
    var interactorInput: PhotoInfoInteractorInput { get set }
}

protocol PhotoInfoPresenterOutput: class {
}
