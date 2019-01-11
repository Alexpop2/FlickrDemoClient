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
    @IBOutlet weak var imgHeight: NSLayoutConstraint!
    
    private var presenter: PhotoInfoPresenterInput!
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        presenter.favouriteButtonClick()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updatePhotoInfo()
    }
}

extension PhotoInfoViewController: PhotoInfoViewInput {
    func setFavouriteIcon(flag: Bool) {
        var buttonImage = #imageLiteral(resourceName: "baseline_favorite_border_black_36pt")
        if(flag) {
            buttonImage = #imageLiteral(resourceName: "baseline_favorite_black_36pt")
        }
        likeButton.setImage(buttonImage, for: .normal)
    }
    
    func set(title: String) {
        titleLabel.text = title
    }
    
    func set(image: URL, imgHeight: String, imgWidth: String) {
        let height = CGFloat(((Float(imgHeight) ?? 1) / (Float(imgWidth) ?? 1))) * UIScreen.main.bounds.width
        self.imgHeight.constant = height
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
