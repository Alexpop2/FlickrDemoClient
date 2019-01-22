//
//  ModulesCreator.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 22/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class ModulesCreator {
    private let internetService: InternetServiceInput
    private let database: DatabaseServiceInput
    
    weak var delegate: ModulesCreatorDelegate!
    
    func create<T>(assembly: MainAssembly, presenterType: T.Type, tabBarSystemItem: UITabBarItem.SystemItem?, tag: Int) -> T? {
        guard let module = assembly.build(internetService: internetService,
                                          database: database)
            else { return nil }
        let presenter = module.presenter as! T
        delegate.add(presenter: module.presenter)
        if(tabBarSystemItem != nil) {
            module.controller.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarSystemItem!, tag: tag)
        }
        delegate.add(controller: module.controller)
        return presenter
    }
    
    init(internetService: InternetServiceInput, database: DatabaseServiceInput) {
        self.internetService = internetService
        self.database = database
    }
}
