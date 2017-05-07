//
//  MovieViewController.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/19/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit
import Kingfisher

class MovieViewController: UIViewController, PushAndPopable {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRatedLabel: UILabel!
    @IBOutlet weak var movieGenresLabel: UILabel!
    @IBOutlet weak var movieSynopsisLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!

    let numberOfItem = 4
    let data = [[1,2], [3,4,5,6,7,8], [5,6], [7,8]]
    var testData: [[BaseModel]] = [[Video()],
                                   [Cast(), Cast(), Cast(), Cast(), Cast(), Cast()],
                                   [Review(), Review()],
                                   [Genre(), Genre()]
                                    ]
    var movieId: Int?
    var movie: Movie? {
        didSet {
            updateUI()
        }
    }
    fileprivate var selectedIndexPath: IndexPath?

    // MARK: - PushAndPopable

    var sourceCell: UIView?
    var scrollViewType: UIScrollView?

    fileprivate var sourceCollectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigationBar()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCellNib(cellClass: MainCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: playButton.frame.width + CGFloat(Margin.default + 2) + 26)

        getMovieDetail()

    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Show segue

        if segue.identifier == SegueID.Show.EpisodeListVC {
            guard let episodeListVC = segue.destination as? EpisodeListViewController,
                let cell = sourceCell as? EpisodeCollectionViewCell else {
                    return
            }
        } else if segue.identifier == SegueID.Show.PlayerVC {
            guard let playerVC = segue.destination as? PlayerViewController,
                let cell = sourceCell as? EpisodeCollectionViewCell else {
                    return
            }
        } else if segue.identifier == SegueID.Show.CastDetailVC {

        } else if segue.identifier == SegueID.Show.CastListVC {

        } else if segue.identifier == SegueID.Show.ReviewListVC {

        } else if segue.identifier == SegueID.Show.RelatedListVC {

        } else if segue.identifier == SegueID.Present.MovieInfoVC {  // Present segue
            guard let navVC = segue.destination as? UINavigationController,
                let movieInfoVC = navVC.topViewController as? MovieInfoViewController else {
                return
            }

        }



    }

    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func didTapInfoButton(_ sender: UIButton) {
        performSegue(withIdentifier: SegueID.Present.MovieInfoVC, sender: self)
    }

}

extension MovieViewController: UICollectionViewDataSource {

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(aClass: MainCollectionViewCell.self, forIndexPath: indexPath)
        return cell
    }

}

extension MovieViewController: UICollectionViewDelegate {

    // MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? MainCollectionViewCell else {
            return
        }
        let childDataSource = ChildCollectionViewDataSource()
        childDataSource.testData = testData[indexPath.row]
        let childDelegate = ChildCollectionViewDelegate()
        childDelegate.delegate = self

        cell.setCollectionView(dataSource: childDataSource, delegate: childDelegate, forRow: indexPath.row)

    }

}

extension MovieViewController: UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * CGFloat(Ratio.MainCollectionViewCell), height: collectionView.frame.height - collectionView.contentInset.top - collectionView.contentInset.bottom)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Margin.default)
    }

}

extension MovieViewController: ChildCollectionViewProtocol {

    // MARK: - ChildCollectionViewCellProtocol

    func collectionViewSelected(_ collectionView: UICollectionView, indexPathFor collectionViewItem: IndexPath) {
        collectionView.deselectItem(at: collectionViewItem, animated: true)
        selectedIndexPath = collectionViewItem
        guard let cell = collectionView.cellForItem(at: collectionViewItem) else {
            return
        }
        scrollViewType = collectionView
        sourceCell = cell
        switch collectionView.tag {
        case 0:
            if collectionViewItem.section == 0 {
                performSegue(withIdentifier: SegueID.Show.PlayerVC, sender: self)
            } else if collectionViewItem.section == 1 {
                performSegue(withIdentifier: SegueID.Show.EpisodeListVC, sender: self)
            }
        case 1:
            performSegue(withIdentifier: SegueID.Show.CastDetailVC, sender: self)
        case 2:
            performSegue(withIdentifier: SegueID.Show.ReviewListVC, sender: self)
        case 3:
            performSegue(withIdentifier: SegueID.Show.PlayerVC, sender: self)
        default:
            break
        }
    }

}

extension MovieViewController {

    fileprivate func getGenres() -> String {
        guard let movie = movie else {
            return "Updating"
        }
        if movie.genres.count > 1 {
            return "\(movie.genres[0].name), \(movie.genres[1].name)"
        }
        return "\(movie.genres[0].name)"
    }

    fileprivate func getMovieDetail() {
        guard let id = movieId else {
            return
        }
        MovieServices.shared.getDetails(movieID: id) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.movie = movies.first
            case .failure(let error):
                print("MovieVC line 77\(error)")
            }
        }
    }

    fileprivate func updateUI() {
        if let movie = movie {
            movieTitleLabel.text = movie.title
            movieRatedLabel.text = "\(movie.voteAverage)"
            movieGenresLabel.text = getGenres()
            movieSynopsisLabel.text = movie.overview
            let imageString = "\(APIs.BackdropURL)\(movie.backdropPath)"
            let imageURL = URL(string: imageString)
            moviePosterImageView.kf.setImage(with: imageURL)
        }
    }

}














