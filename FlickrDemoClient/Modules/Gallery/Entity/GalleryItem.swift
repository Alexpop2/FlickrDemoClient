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
}

extension GalleryItem: GalleryTableViewCellViewModel {
    var imageUrl: URL {
        return url
    }
    
    var title: String {
        return name
    }
}
