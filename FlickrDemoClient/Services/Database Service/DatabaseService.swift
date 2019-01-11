//
//  DatabaseService.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseService: DatabaseServiceInput {
    func loadEntites() -> [PostEntity] {
        let realm = try! Realm()
        let postEntities = realm.objects(PostEntity.self)
        //let postEntities = realm.objects(PostEntity.self).filter("id = '43055984340'")
        var postEntitiesArray = [PostEntity]()
        for entity in postEntities {
            let postEntity = PostEntity()
            postEntity.id = entity.id
            postEntity.title = entity.title
            postEntity.imgHeight = entity.imgHeight
            postEntity.imgWidth = entity.imgWidth
            postEntity.url = entity.url
            postEntitiesArray.append(postEntity)
        }
        return postEntitiesArray
    }
    
    func saveEntites(data: [PostEntity])  {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        for galleryItem in data {
            try! realm.write {
                realm.create(PostEntity.self, value: [galleryItem.id,
                                                      galleryItem.title,
                                                      galleryItem.url,
                                                      galleryItem.imgHeight,
                                                      galleryItem.imgWidth])
            }
        }
    }
    
    func addEntity(galleryItem: PostEntity) {
        let realm = try! Realm()
        let postEntities = realm.objects(PostEntity.self).filter("id = %@", galleryItem.id)
        if(postEntities.count==0) {
            try! realm.write {
                realm.create(PostEntity.self, value: [galleryItem.id,
                                                      galleryItem.title,
                                                      galleryItem.url,
                                                      galleryItem.imgHeight,
                                                      galleryItem.imgWidth])
            }
        }
    }
    
    func deleteEntity(galleryItem: PostEntity) {
        let realm = try! Realm()
        let postEntities = realm.objects(PostEntity.self).filter("id = %@", galleryItem.id)
        if(postEntities.count>0) {
            try! realm.write {
                realm.delete(postEntities)
            }
        }
    }
}

