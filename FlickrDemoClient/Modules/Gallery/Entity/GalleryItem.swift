//
//  GalleryItem.swift
//  FlickrDemoClient
//
//  Created by Igor on 05/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

struct GalleryItem {
    var id: String
    var name: String
    var url: URL
    var imgHeight: String
    var imgWidth: String
    var favouriteIcon: Bool
}

extension GalleryItem: GalleryTableViewCellViewModel {
    var favourite: Bool {
        return favouriteIcon
    }
    
    var height: String {
        return imgHeight
    }
    
    var width: String {
        return imgWidth
    }
    
    var imageUrl: URL {
        return url
    }
    
    var title: String {
        return name
    }
    
}

extension GalleryItem: FavouritesTableViewCellViewModel {
    
}
