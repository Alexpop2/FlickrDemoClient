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
    var picture: UIImageView?
}

extension GalleryItem: GalleryTableViewCellViewModel {
    var title: String {
        return name
    }
    
    var image: UIImageView {
        guard let picture = picture else { return UIImageView() }
        return picture
    }
    
    
}
