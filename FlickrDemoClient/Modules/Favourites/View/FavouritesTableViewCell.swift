//
//  FavouritesTableViewCell.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit
import Kingfisher

class FavouritesTableViewCell: UITableViewCell {
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: FavouritesTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            pictureImageView.kf.setImage(with: viewModel.imageUrl)
        }
    }
    
}
