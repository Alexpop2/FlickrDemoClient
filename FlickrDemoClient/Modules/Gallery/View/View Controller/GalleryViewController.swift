//
//  GalleryViewController.swift
//  FlickrDemoClient
//
//  Created by Igor on 04/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

// MARK: - Properties and lifecycle

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let galleryTableViewCellNib = UINib(nibName: "GalleryTableViewCell", bundle: nil)
    private let reusableCellIdentifier = "GalleryCellReusableIdentyfier"
    private var presenter: GalleryPresenterInput!
    private var dataSource = [GalleryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.updatePictures()
        setUpUI()
    }
}

// MARK: - GalleryViewInput protocol implementation

extension GalleryViewController: GalleryViewInput {
    var presenterInput: GalleryPresenterInput {
        get {
            return presenter
        }
        set {
            presenter = newValue as! GalleryPresenter
        }
    }
    
    func display(galleryItems: [GalleryItem]) {
        dataSource = galleryItems
        tableView.reloadData()
    }
}

// MARK: - Setting up UI for custom tableView cell

extension GalleryViewController {
    private func setUpUI() {
        tableView.register(galleryTableViewCellNib, forCellReuseIdentifier: reusableCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - TableView protocols implementation

extension GalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableCellIdentifier, for: indexPath) as? GalleryTableViewCell else { return UITableViewCell() }
        cell.viewModel = dataSource[indexPath.row]
        return cell
    }
}

extension GalleryViewController: UITableViewDelegate {
    
}
