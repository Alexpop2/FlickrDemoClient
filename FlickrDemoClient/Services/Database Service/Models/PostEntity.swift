//
//  PostEntity.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import RealmSwift

class PostEntity: Object {
    @objc dynamic var id: String!
    @objc dynamic var title: String!
    @objc dynamic var url: String!
    @objc dynamic var imgHeight: String!
    @objc dynamic var imgWidth: String!
}
