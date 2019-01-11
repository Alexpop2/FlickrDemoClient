//
//  FavouritesPresenterProtocols.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol FavouritesPresenterInput: class {
    var output: FavouritesPresenterOutput { get set }
    var viewInput: FavouritesViewInput { get set }
    var interactorInput: FavouritesInteractorInput { get set }
    func updatePictures()
}

protocol FavouritesPresenterOutput: class {
    func showPostDetails(post: GalleryItem)
}

