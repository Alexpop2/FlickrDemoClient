//
//  FavouritesTableViewCellModel.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol FavouritesTableViewCellViewModel {
    var title: String { get }
    var imageUrl: URL { get }
    var height: String { get }
    var width: String { get }
}
