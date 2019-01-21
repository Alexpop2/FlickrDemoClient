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
    func build(internetService: InternetServiceInput,
               database: DatabaseServiceInput) -> (controller: UIViewController, presenter: PhotoInfoPresenterInput)? {
        let storyboard = UIStoryboard(name: "PhotoInfoStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "PhotoInfoViewControllerIdentifier")
        guard let galleryVC = rootVC as? PhotoInfoViewController else {
            return nil
        }
        
        let presenter = PhotoInfoPresenter()
        let interactor = PhotoInfoInteractor()
        
        galleryVC.viewOutput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = galleryVC
        interactor.output = presenter
        
        interactor.internetService = internetService
        interactor.database = database
        
        return(controller: galleryVC, presenter: presenter)
    }
}
