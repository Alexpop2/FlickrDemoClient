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
    private var navigationController: UINavigationController
    private var viewControllers: [UIViewController]
    
    
    func rootModuleController() -> UIViewController {
        let galleryAssembly = GalleryAssembly()
        guard let gallery = galleryAssembly.build(internetService: internetService,
                                                  database: database)
            else { return UIViewController() }
        gallery.presenter.output = self
        viewControllers.append(gallery.controller)
        navigationController.viewControllers = viewControllers
        return navigationController
    }
    
    init(internetService: InternetServiceInput, database: DatabaseServiceInput) {
        self.internetService = internetService
        self.database = database
        self.navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        viewControllers = [UIViewController]()
    }
}

extension ModulesCoordinator: GalleryPresenterOutput {
    func showPostDetails(post: GalleryItem) {
        let photoInfoAssembly = PhotoInfoAssembly()
        guard let photoInfo = photoInfoAssembly.build(internetService: internetService,
                                                      database: database)
            else { return }
        photoInfo.presenter.interactorInput.galleryItem = post
        navigationController.pushViewController(photoInfo.controller, animated: true)
    }
}

extension ModulesCoordinator: PhotoInfoPresenterOutput {
    
}
