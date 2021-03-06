//
//  PhotoInfoViewControllerProtocols.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol PhotoInfoViewInput: class {
    var viewOutput: PhotoInfoViewOutput { get set }
    func set(title: String)
    func set(image: URL, imgHeight: String, imgWidth: String)
    func setFavouriteIcon(flag: Bool)
}

protocol PhotoInfoViewOutput: class {
    func loadPhotoInfo()
    func favouriteButtonClick()
}
