//
//  GalleryAssembly.swift
//  FlickrDemoClient
//
//  Created by Igor on 06/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class GalleryAssembly {
    func build(internetService: InternetServiceInput,
               database: DatabaseServiceInput) -> (controller: UIViewController, presenter: GalleryPresenterInput)? {
        let storyboard = UIStoryboard(name: "GalleryStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "GalleryViewControllerIdentifier")
        guard let galleryVC = rootVC as? GalleryViewController else {
            return nil
        }
        
        let presenter = GalleryPresenter()
        let interactor = GalleryInteractor()
        
        galleryVC.viewOutput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = galleryVC
        interactor.output = presenter
        
        interactor.internetService = internetService
        interactor.database = database
        
        return(controller: galleryVC, presenter: presenter)
    }
}
