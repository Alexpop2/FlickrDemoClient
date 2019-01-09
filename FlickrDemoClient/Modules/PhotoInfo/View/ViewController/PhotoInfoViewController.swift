//
//  PhotoInfoViewController.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class PhotoInfoViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    private var presenter: PhotoInfoPresenterInput!
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
    }
    
}

extension PhotoInfoViewController: PhotoInfoViewInput {
    var presenterInput: PhotoInfoPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}
