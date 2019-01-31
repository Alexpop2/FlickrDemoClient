//
//  ControllerPackageProtocol.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 31/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

protocol ControllerPackageProtocol: class{
    var controller: UIViewController {get set}
    var presenter: MainPresenter {get set}
}

