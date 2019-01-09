//
//  PhotoInfoViewController.swift
//  FlickrDemoClient
//
//  Created by Igor on 07/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class PhotoInfoViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    private var presenter: PhotoInfoPresenterInput!
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updatePhotoInfo()
    }
}

extension PhotoInfoViewController: PhotoInfoViewInput {
    func set(title: String) {
        titleLabel.text = title
    }
    
    func set(image: URL) {
        photoImageView.kf.setImage(with: image)
    }
    
    var presenterInput: PhotoInfoPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue
        }
    }
}
