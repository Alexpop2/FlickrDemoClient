//
//  FavouritesViewControllerProtocols.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol FavouritesViewInput: class {
    var viewOutput: FavouritesViewOutput { get set }
    func display(galleryItems: [GalleryItem])
}

protocol FavouritesViewOutput: class {
    func loadPictures()
    func tableRowClick(post: GalleryItem)
}

protocol RoutingFavouritesView: class {
    func presentFavouritesView()
}
