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
    
    private var navigationController: UINavigationController
    private var tabBarController: UITabBarController
    private var viewControllers: [UIViewController]
    private var presenters: [MainPresenter]
    private var modulesCreator: ModulesCreator
    
    func rootModuleController() -> UIViewController {
        modulesCreator.create(assembly: GalleryAssembly(),
                              presenterType: GalleryPresenterInput.self,
                              tabBarSystemItem: .recents,
                              tag: Presenters.galleryPresenter.rawValue)?.delegate = self
        
        modulesCreator.create(assembly: FavouritesAssembly(),
                              presenterType: FavouritesPresenterInput.self,
                              tabBarSystemItem: .favorites,
                              tag: Presenters.favouritePresenter.rawValue)?.delegate = self
        
        tabBarController.viewControllers = viewControllers
        
        return navigationController
    }
    
    init(internetService: InternetServiceInput, database: DatabaseServiceInput) {
        self.tabBarController = UITabBarController()
        self.navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.navigationBar.prefersLargeTitles = true
        viewControllers = [UIViewController]()
        presenters = [MainPresenter]()
        modulesCreator = ModulesCreator(internetService: internetService, database: database)
        modulesCreator.delegate = self
    }
}

extension ModulesCoordinator: GalleryPresenterDelegate {
    func showPostDetails(post: GalleryItem) {
        if(presenters.indices.contains(Presenters.photoInfoPresenter.rawValue)) {
            presenters.remove(at: Presenters.photoInfoPresenter.rawValue)
            viewControllers[Presenters.photoInfoPresenter.rawValue].dismiss(animated: false, completion: nil)
            viewControllers.remove(at: Presenters.photoInfoPresenter.rawValue)
        }

        modulesCreator.create(assembly: PhotoInfoAssembly(),
                              presenterType: PhotoInfoPresenterInput.self,
                              tabBarSystemItem: nil,
                              tag: Presenters.photoInfoPresenter.rawValue)?.delegate = self
        
        (presenters[Presenters.photoInfoPresenter.rawValue] as! PhotoInfoPresenterInput).setGalleryItem(item: post)
        navigationController.pushViewController(viewControllers[Presenters.photoInfoPresenter.rawValue], animated: true)
    }
}

extension ModulesCoordinator: PhotoInfoPresenterDelegate {
    func updateFavourite(id: String, favourite: Bool) {
        (presenters[Presenters.galleryPresenter.rawValue] as! GalleryPresenterInput).operateWithFavourite(id: id, status: favourite)
        (presenters[Presenters.favouritePresenter.rawValue] as! FavouritesPresenterInput).operateWithFavourite(id: id, status: favourite)
    }
}

extension ModulesCoordinator: FavouritesPresenterDelegate {}

extension ModulesCoordinator: ModulesCreatorDelegate {
    func add(presenter: MainPresenter) {
        presenters.append(presenter)
    }
    
    func add(controller: UIViewController) {
        viewControllers.append(controller)
    }
}
