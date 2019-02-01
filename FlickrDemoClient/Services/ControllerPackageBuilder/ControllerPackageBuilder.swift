//
//  ControllerPackageBuilder.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 31/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

//MARK: - Facade implementation

import Foundation
import UIKit

enum ViewControllers {
    case gallery
    case photoInfo
    case favourites
}

class ControllerPackageBuilder: ControllerPackageBuilderProtocol {
    
    private let internetService: InternetServiceInput = InternetService()
    private let database: DatabaseServiceInput = DatabaseService()
    private let modulesCoordinator : ModulesCoordinator

    
    init(modulesCoordinator: ModulesCoordinator){
        self.modulesCoordinator = modulesCoordinator
    }
    
    func createPackage(type: ViewControllers )-> (ControllerPackageProtocol?){
        switch type {
        case .gallery:
            return createFlickraController()
            
        case .photoInfo:
            return createDetailPhotoController()
            
        case .favourites:
            return createFavoritesController()
        }
    }
    
//    func getViewController(controller: ViewControllers) {
//        switch controller {
//        case .gallery:
//
//        }
//    }
}

extension ControllerPackageBuilder {
    private func createFlickraController()-> (ControllerPackageProtocol?){
        let flickraAssembly = GalleryAssembly()
        guard let flickra = flickraAssembly.build(internetService: internetService, database: database) else {return nil}
        flickra.presenter.delegate = modulesCoordinator
        flickra.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 0)
        return  ControllerPackage(controller: flickra.controller, presenter: flickra.presenter)
    }
    
    private func createDetailPhotoController()-> (ControllerPackageProtocol?){
        let detailPhotoView = PhotoInfoAssembly()
        guard let detailPhoto = detailPhotoView.build(internetService: internetService, database: database) else {return nil}
        detailPhoto.presenter.delegate = modulesCoordinator
        return ControllerPackage(controller: detailPhoto.controller, presenter: detailPhoto.presenter)
    }
    
    private func createFavoritesController()-> (ControllerPackageProtocol?){
        let favoritesView = FavouritesAssembly()
        guard let favorites = favoritesView.build(internetService: internetService, database: database)else {return nil}
        favorites.presenter.delegate = modulesCoordinator
        favorites.controller.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return ControllerPackage(controller: favorites.controller, presenter:favorites.presenter)
    }
}

