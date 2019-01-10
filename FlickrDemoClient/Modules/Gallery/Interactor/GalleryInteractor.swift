//
//  GalleryInteractor.swift
//  FlickrDemoClient
//
//  Created by Igor on 04/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - Properties

class GalleryInteractor {
    private var presenter: GalleryInteractorOutput!
    var internetService: InternetServiceInput!
    var database: DatabaseServiceInput!
    private var favouriteList = [String]()
}

// MARK: - GalleryInteractorInput protocol implementation

extension GalleryInteractor: GalleryInteractorInput {
    func loadFavourites() {
        let loadEntities = database.loadEntites()
        for entity in loadEntities {
            favouriteList.append(entity.id)
        }
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
    
    var output: GalleryInteractorOutput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
    
    func updateImages() {
        let url = URL(string: "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&per_page=40&page=1&format=json&nojsoncallback=1&extras=url_l&date=2018-09-23")
        internetService.loadData(fromURL: url, parseInto: FlickrResponse.self, success: { (response: FlickrResponse) in
            self.presenter.setDataSource(parsedInput: response, favouriteList: self.favouriteList)
        }) { (code) in
            print("Error")
        }
    }
}


