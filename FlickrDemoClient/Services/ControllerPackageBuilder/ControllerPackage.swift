//
//  ControllerPackage.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 31/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class ControllerPackage : ControllerPackageProtocol{
    var controller: UIViewController
    var presenter: MainPresenter
    
    init(controller:UIViewController, presenter: MainPresenter){
        self.controller = controller
        self.presenter = presenter
    }
}
