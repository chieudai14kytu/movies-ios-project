//
//  TVViewController.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/18/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class TVListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        blueNavigationBar()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellNib(cellClass: MovieThumbnailCell.self)
        getMovies()
    }

    func getMovies() {
        MovieServices.shared.getTopRated { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movies = movies
            case .failure(let error):
                print("MoviesVC line 31\(error)")
            }
        }
        
    }

     // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }

}

extension TVListViewController: UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(aClass: MovieThumbnailCell.self, forIndexPath: indexPath)
        cell.movie = movies[indexPath.row]
        return cell
    }

}

extension TVListViewController: UITableViewDelegate {

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CellHeight.MovieThumbnail)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
