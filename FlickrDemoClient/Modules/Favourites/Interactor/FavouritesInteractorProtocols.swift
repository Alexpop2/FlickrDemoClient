//
//  FavouritesInteractorProtocols.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol FavouritesInteractorInput: class {
    var output: FavouritesInteractorOutput { get set }
    
    func updateImages()
    func addFavouritesToDB(items: [PostEntity])
    func operateWithFavourite(id: String, status: Bool)
}

protocol FavouritesInteractorOutput: class {
    func setDataSource(items: [GalleryItem], favouriteList: [String])
}
