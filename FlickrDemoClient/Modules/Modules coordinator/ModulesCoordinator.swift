//
//  ModulesCoordinator.swift
//  FlickrDemoClient
//
//  Created by Igor on 06/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class ModulesCoordinator {
    
    private let internetService: InternetServiceInput
    private let database: DatabaseServiceInput
    
    func rootModuleController() -> UIViewController {
        let galleryAssembly = GalleryAssembly()
        guard let gallery = galleryAssembly.build(internetService: internetService,
                                                  database: database)
            else { return UIViewController() }
        return gallery.controller
    }
    
    init(internetService: InternetServiceInput, database: DatabaseServiceInput) {
        self.internetService = internetService
        self.database = database
    }
}

extension ModulesCoordinator: GalleryPresenterOutput {
    func updateDataSource(data: [GalleryItem]) {
        
    }
}

extension ModulesCoordinator: PhotoInfoPresenterOutput {
    
}
