//
//  Application.swift
//  FlickrDemoClient
//
//  Created by Igor on 06/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class Application {
    private let modulesCoordinator: ModulesCoordinator
    
    init() {
        modulesCoordinator = ModulesCoordinator(internetService: InternetService(),
                                                database: DatabaseService())
    }
}

extension Application {
    func loadRootVC() -> UIViewController {
        return modulesCoordinator.rootModuleController()
    }
}
