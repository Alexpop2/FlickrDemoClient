//
//  MainAssembly.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 22/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

protocol MainAssembly {
    func build(internetService: InternetServiceInput,
               database: DatabaseServiceInput) -> (controller: UIViewController, presenter: MainPresenter)?
}
