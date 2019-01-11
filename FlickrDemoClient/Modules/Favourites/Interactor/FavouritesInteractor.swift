//
//  FavouritesInteractor.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

class FavouritesInteractor {
    private var presenter: FavouritesInteractorOutput!
    var internetService: InternetServiceInput!
    var database: DatabaseServiceInput!
    private var favouriteList = [String]()
}

extension FavouritesInteractor: FavouritesInteractorInput {
    func updateImages() {
        let loadEntities = database.loadEntites()
        var items = [GalleryItem]()
        for entity in loadEntities {
            favouriteList.append(entity.id)
            guard let url = URL(string: entity.url) else { return }
            items.append(GalleryItem(id: entity.id,
                                     name: entity.title,
                                     url: url,
                                     imgHeight: entity.imgHeight,
                                     imgWidth: entity.imgWidth,
                                     favouriteIcon: true))
        }
        presenter.setDataSource(items: items, favouriteList: favouriteList)
    }
    
    func addFavouritesToDB(items: [PostEntity]) {
        database.saveEntites(data: items)
    }
    
    func operateWithFavourite(id: String, status: Bool) {
        if(favouriteList.contains(id)) {
            favouriteList = favouriteList.filter { $0 != id }
        } else {
            favouriteList.append(id)
        }
        updateImages()
    }
    
    var output: FavouritesInteractorOutput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}
