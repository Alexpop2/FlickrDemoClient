//
//  TableViewCell.swift
//  FlickrDemoClient
//
//  Created by Igor on 05/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit
import Kingfisher

class GalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureHeight: NSLayoutConstraint!
    
    var viewModel: GalleryTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            //let height = CGFloat(((Float(viewModel.height) ?? 1) / (Float(viewModel.width) ?? 1))) * UIScreen.main.bounds.width
            //pictureHeight.constant = height
            pictureImageView.kf.setImage(with: viewModel.imageUrl)
            //pictureHeight.priority = UILayoutPriority(999)
        }
    }
}
