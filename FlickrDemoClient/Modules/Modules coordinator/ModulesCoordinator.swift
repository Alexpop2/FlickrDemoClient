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
    private var tabBarController: GalleryTabBarController
    private var viewControllers: [UIViewController]
    private var currentPresenter: MainPresenter!
    private var galleryPresenter: GalleryPresenterInput!
    private var favouritesPresenter: FavouritesPresenterInput!
    
    
    func rootModuleController() -> UIViewController {
        let galleryAssembly = GalleryAssembly()
        guard let gallery = galleryAssembly.build(internetService: internetService,
                                                  database: database)
            else { return UIViewController() }
        galleryPresenter = gallery.presenter
        gallery.presenter.output = self
        gallery.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        viewControllers.append(gallery.controller)
        
        let favouritesAssembly = FavouritesAssembly()
        guard let favourites = favouritesAssembly.build(internetService: internetService,
                                                  database: database)
            else { return UIViewController() }
        favouritesPresenter = favourites.presenter
        favourites.presenter.output = self
        favourites.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        viewControllers.append(favourites.controller)
        
        tabBarController.viewControllers = viewControllers
        return navigationController
    }
    
    init(internetService: InternetServiceInput, database: DatabaseServiceInput) {
        self.internetService = internetService
        self.database = database
        self.tabBarController = GalleryTabBarController()
        self.navigationController = UINavigationController(rootViewController: tabBarController)
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
        photoInfo.presenter.output = self
        photoInfo.presenter.interactorInput.galleryItem = post
        navigationController.pushViewController(photoInfo.controller, animated: true)
    }
}

extension ModulesCoordinator: PhotoInfoPresenterOutput {
    func updateFavourite(id: String, favourite: Bool) {
        galleryPresenter.interactorInput.operateWithFavourite(id: id, status: favourite)
        favouritesPresenter.interactorInput.operateWithFavourite(id: id, status: favourite)
    }
}

extension ModulesCoordinator: FavouritesPresenterOutput {
    
}
