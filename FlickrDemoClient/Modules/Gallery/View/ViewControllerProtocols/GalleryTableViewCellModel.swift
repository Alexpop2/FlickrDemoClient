//
//  GalleryTableViewCellModel.swift
//  FlickrDemoClient
//
//  Created by Igor on 05/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

protocol GalleryTableViewCellViewModel {
    var title: String { get }
    var imageUrl: URL { get }
}
