//
//  ControllerPackageBuilderProtocol.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 31/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation

protocol ControllerPackageBuilderProtocol: class {
    func createPackage(type: ViewControllers )->(ControllerPackageProtocol?)
}

