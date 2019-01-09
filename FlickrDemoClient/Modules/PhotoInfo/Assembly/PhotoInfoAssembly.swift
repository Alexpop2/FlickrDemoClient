//
//  PhotoInfoAssembly.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class PhotoInfoAssembly {
    func build(internetService: InternetServiceInput, database: DatabaseServiceInput) -> (controller: UIViewController, presenter: GalleryPresenterInput)? {
        let storyboard = UIStoryboard(name: "PhotoInfoStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "GalleryNavigationControllerIdentifier")
        guard let navigationVC = rootVC as? UINavigationController,
            let galleryVC = navigationVC.viewControllers.first as? GalleryViewController else {
                return nil
        }
        
        let presenter = GalleryPresenter()
        let interactor = GalleryInteractor()
        
        galleryVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = galleryVC
        interactor.output = presenter
        
        interactor.internetService = internetService
        interactor.database = database
        
        return(controller: navigationVC, presenter: presenter)
    }
}
