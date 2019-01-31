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
    
    private var output: PhotoInfoViewOutput!
    
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        output.favouriteButtonClick()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        output.loadPhotoInfo()
    }
}

extension PhotoInfoViewController: PhotoInfoViewInput {
    func setFavouriteIcon(flag: Bool) {
        if(isViewLoaded) {
            var buttonImage = #imageLiteral(resourceName: "baseline_favorite_border_black_36pt")
            if(flag) {
                buttonImage = #imageLiteral(resourceName: "baseline_favorite_black_36pt")
            }
            likeButton.setImage(buttonImage, for: .normal)
        }
    }
    
    func set(title: String) {
        if(isViewLoaded) {
            titleLabel.text = title
        }
    }
    
    func set(image: URL, imgHeight: String, imgWidth: String) {
        if(isViewLoaded) {
            let height = CGFloat(((Float(imgHeight) ?? 1) / (Float(imgWidth) ?? 1))) * UIScreen.main.bounds.width
            self.imgHeight.constant = height
            photoImageView.kf.setImage(with: image)
        }
    }
    
    var viewOutput: PhotoInfoViewOutput {
        get {
            return output
        }
        set {
            output = newValue
        }
    }
}
