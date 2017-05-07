//
//  MoviesViewController.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/18/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, PushAndPopable {

    @IBOutlet weak var tableView: UITableView!

    var movies: [Movie] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    fileprivate var selectedIndexPath: IndexPath?

    // MARK - PushAndPopable

    var sourceCell: UIView?
    var scrollViewType: UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        blueNavigationBar()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
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

        if segue.identifier == SegueID.Show.MovieVC {
            guard let movieVC = segue.destination as? MovieViewController,
                let selectedIndexPath = selectedIndexPath,
                let cell = tableView.cellForRow(at: selectedIndexPath) else {
                return
            }
            sourceCell = cell
            scrollViewType = self.tableView
            let movie = movies[selectedIndexPath.row]
            movieVC.movieId = movie.id
        }
        
    }

    var isInterative = false
    var interactionTransition: UIPercentDrivenInteractiveTransition?

}

extension MovieListViewController: UITableViewDataSource {

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


extension MovieListViewController: UITableViewDelegate {

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CellHeight.MovieThumbnail)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: SegueID.Show.MovieVC, sender: self)
    }
    
}

extension MovieListViewController: UINavigationControllerDelegate {

    // MARK: - UINavigationControllerDelegate

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        if isInterative {
//            return ZoomInAndOutAnimator(operation: operation)
//        }
        return PopInAndOutAnimator(operation: operation)
    }

//    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return isInterative ? interactionTransition : nil
//    }

}












