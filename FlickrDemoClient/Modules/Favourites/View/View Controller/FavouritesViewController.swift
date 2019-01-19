//
//  FavouritesViewController.swift
//  FlickrDemoClient
//
//  Created by Рабочий on 10/01/2019.
//  Copyright © 2019 Igor. All rights reserved.
//

import Foundation
import UIKit

class FavouritesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let galleryTableViewCellNib = UINib(nibName: "FavouritesTableViewCell", bundle: nil)
    private let reusableCellIdentifier = "FavouritesCellReusableIdentyfier"
    private var output: FavouritesViewOutput!
    private var dataSource = [GalleryItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.loadPictures()
        setUpUI()
    }
}

// MARK: - GalleryViewInput protocol implementation

extension FavouritesViewController: FavouritesViewInput {
    var viewOutput: FavouritesViewOutput {
        get {
            return output
        }
        set {
            output = newValue
        }
    }
    
    func display(galleryItems: [GalleryItem]) {
        dataSource = galleryItems
        tableView.reloadData()
    }
}

// MARK: - Setting up UI for custom tableView cell

extension FavouritesViewController {
    private func setUpUI() {
        tableView.register(galleryTableViewCellNib, forCellReuseIdentifier: reusableCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 1000
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - TableView protocols implementation

extension FavouritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reusableCellIdentifier,
                                                       for: indexPath) as? FavouritesTableViewCell else { return UITableViewCell() }
        cell.viewModel = dataSource[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let viewModel = dataSource[indexPath.row]
        let height = CGFloat(((Float(viewModel.height) ?? 1) / (Float(viewModel.width) ?? 1))) * UIScreen.main.bounds.width + 41
        return height
    }
}

// MARK: - UITableViewDelegate Implementation

extension FavouritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.output.tableRowClick(post: dataSource[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
