//
//  FavouritesAssembly.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class FavouritesAssembly {
    func build(internetService: InternetServiceInput,
               database: DatabaseServiceInput) -> (controller: UIViewController, presenter: FavouritesPresenterInput)? {
        let storyboard = UIStoryboard(name: "FavouritesStoryboard", bundle: nil)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "FavouritesViewControllerIdentifier")
        guard let galleryVC = rootVC as? FavouritesViewController else {
            return nil
        }
        
        let presenter = FavouritesPresenter()
        let interactor = FavouritesInteractor()
        
        galleryVC.presenterInput = presenter
        presenter.interactorInput = interactor
        presenter.viewInput = galleryVC
        interactor.output = presenter
        
        interactor.internetService = internetService
        interactor.database = database
        
        return(controller: galleryVC, presenter: presenter)
    }
}
