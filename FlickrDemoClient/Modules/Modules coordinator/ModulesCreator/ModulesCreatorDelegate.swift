//
//  ModulesCreatorDelegate.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 22/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

protocol ModulesCreatorDelegate: class {
    func add(presenter: MainPresenter)
    func add(controller: UIViewController)
}
