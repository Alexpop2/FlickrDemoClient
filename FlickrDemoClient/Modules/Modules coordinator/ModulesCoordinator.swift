//
//  ModulesCoordinator.swift
//  FlickrDemoClient
//
//  Created by Igor on 06/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

enum Presenters: Int {
    case galleryPresenter = 0
    case favouritePresenter = 1
    case photoInfoPresenter = 2
}

class ModulesCoordinator {
    
    private let internetService: InternetServiceInput
    private let database: DatabaseServiceInput
    private var navigationController: UINavigationController
    private var tabBarController: GalleryTabBarController
    private var viewControllers: [UIViewController]
    private var presenters: [Any]
    
    private var currentPresenter: Int!
    
    private var favouritesFirstRun = false
    
    func rootModuleController() -> UIViewController {
        let galleryAssembly = GalleryAssembly()
        guard let gallery = galleryAssembly.build(internetService: internetService,
                                                  database: database)
            else { return UIViewController() }
        presenters.append(gallery.presenter)
        gallery.presenter.delegate = self
        gallery.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: Presenters.galleryPresenter.rawValue)
        viewControllers.append(gallery.controller)
        
        let favouritesAssembly = FavouritesAssembly()
        guard let favourites = favouritesAssembly.build(internetService: internetService,
                                                        database: database)
            else { return UIViewController() }
        presenters.append(favourites.presenter)
        favourites.presenter.delegate = self
        favourites.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: Presenters.favouritePresenter.rawValue)
        viewControllers.append(favourites.controller)
        
        tabBarController.viewControllers = viewControllers
        currentPresenter = Presenters.galleryPresenter.rawValue
        
        return navigationController
    }
    
    init(internetService: InternetServiceInput, database: DatabaseServiceInput) {
        self.internetService = internetService
        self.database = database
        self.tabBarController = GalleryTabBarController()
        self.navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.navigationBar.prefersLargeTitles = true
        viewControllers = [UIViewController]()
        presenters = [Any]()
        tabBarController.tabBarDelegate = self
    }
}

extension ModulesCoordinator: GalleryPresenterDelegate {
    func showPostDetails(post: GalleryItem) {
        let photoInfoAssembly = PhotoInfoAssembly()
        guard let photoInfo = photoInfoAssembly.build(internetService: internetService,
                                                      database: database)
            else { return }
        photoInfo.presenter.delegate = self
        photoInfo.presenter.interactorInput.galleryItem = post
        navigationController.pushViewController(photoInfo.controller, animated: true)
    }
}

extension ModulesCoordinator: PhotoInfoPresenterDelegate {
    func updateFavourite(id: String, favourite: Bool) {
        (presenters[Presenters.galleryPresenter.rawValue] as! GalleryPresenterInput).interactorInput.operateWithFavourite(id: id,
                                                                                                                          status: favourite)
        if(favouritesFirstRun) {
            (presenters[Presenters.favouritePresenter.rawValue] as! FavouritesPresenterInput)
                .interactorInput.operateWithFavourite(id: id,
                                                      status: favourite)
        }
    }
}

extension ModulesCoordinator: FavouritesPresenterDelegate {
    
}

extension ModulesCoordinator: GalleryTabBarDelegate {
    func tabClicked(tag: Int) {
        if(tag == Presenters.favouritePresenter.rawValue) {
            favouritesFirstRun = true
        }
    }
}
