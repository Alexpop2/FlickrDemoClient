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
    
    lazy private var controllerPackageBuilder: ControllerPackageBuilderProtocol = ControllerPackageBuilder(modulesCoordinator: self)
    private var presenterArray : [MainPresenter] = []
    private var viewControllers : [UIViewController] = []
    
    init() {
        self.tabBarController = UITabBarController()
        self.navigationController = UINavigationController(rootViewController: tabBarController)
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func rootModuleController() -> UIViewController {
        presentGalleryView()
        presentFavouritesView()
        
        tabBarController.viewControllers = viewControllers
        
        return navigationController
    }
    
    private func removeFromPresenterArray<T>(_ : T.Type){
        for i in 0..<presenterArray.count {
            guard presenterArray[i] is (T) else {continue}
            presenterArray.remove(at: i)
        }
    }
    
    private func findPresenter<T>(_: T.Type) -> (T?){
        var presenter:(T)?
        for i in 0..<presenterArray.count {
            guard let find = presenterArray[i] as? (T) else { continue}
            presenter = find
        }
        return presenter
    }
    
    private func findViewController<T>(_: T.Type) -> (T?){
        var controller:(T)?
        for i in 0..<viewControllers.count {
            guard let find = viewControllers[i] as? (T) else { continue}
            controller = find
        }
        return controller
    }
    
    private func presentController(type: ViewControllers, push: Bool){
        guard let controllerPackage = controllerPackageBuilder.createPackage(type: type) else {return}
        presenterArray.append(controllerPackage.presenter)
        viewControllers.append(controllerPackage.controller)
        if(push) {
            navigationController.pushViewController(controllerPackage.controller, animated: true)
        }
    }
    
    private func presentController(controller: UIViewController) {
        navigationController.pushViewController(controller, animated: true)
    }
    
}

extension ModulesCoordinator: GalleryPresenterDelegate {
    func showPostDetails(post: GalleryItem) {
        presentPhotoInfoView()
        guard let photoInfoPresenter = findPresenter(PhotoInfoPresenterInput.self) else {return}
        photoInfoPresenter.setGalleryItem(item: post)
    }
}

extension ModulesCoordinator: PhotoInfoPresenterDelegate {
    func updateFavourite(id: String, favourite: Bool) {
        let galleryPresenter = findPresenter(GalleryPresenterInput.self)
        let favouritesPresenter = findPresenter(FavouritesPresenterInput.self)
        if(galleryPresenter != nil) {
            galleryPresenter!.operateWithFavourite(id: id, status: favourite)
        }
        if(favouritesPresenter != nil) {
            favouritesPresenter!.operateWithFavourite(id: id, status: favourite)
        }
    }
}

extension ModulesCoordinator: FavouritesPresenterDelegate {}

//MARK: - Impementation routing protocols

extension ModulesCoordinator : RoutingGalleryView {
    func presentGalleryView() {
        guard let galleryViewController = findViewController(GalleryViewController.self) else {
            presentController(type: .gallery, push: false)
            return
        }
        presentController(controller: galleryViewController)
    }
}

extension ModulesCoordinator : RoutingPhotoInfoView {
    func presentPhotoInfoView() {
        guard let photoInfoViewController = findViewController(PhotoInfoViewController.self) else {
            presentController(type: .photoInfo, push: true)
            return
        }
        presentController(controller: photoInfoViewController)
    }
}

extension ModulesCoordinator : RoutingFavouritesView {
    func presentFavouritesView() {
        guard let favouritesViewController = findViewController(FavouritesViewController.self) else {
            presentController(type: .favourites, push: false)
            return
        }
        presentController(controller: favouritesViewController)
    }
}
