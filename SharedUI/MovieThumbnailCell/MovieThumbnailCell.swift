//
//  MovieThumbnailCell.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/19/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit
import Kingfisher

class MovieThumbnailCell: UITableViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var roundedView: UIView!
    
    var movie: Movie? {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        roundedView.layer.cornerRadius = CGFloat(CornerValue.default)
        roundedView.layer.borderColor = UIColor.white.cgColor
        roundedView.layer.borderWidth = 2.0
        roundedView.clipsToBounds = true
    }

    private func updateUI() {
        coverImageView.image = nil // default image
        titleLabel.text = ""
        rateLabel.text = ""
        guard let movie = movie else {
            return
        }
        let imageString = "\(APIs.BackdropURL)\(movie.backdropPath)"
        let imageURL = URL(string: imageString)
        coverImageView.kf.setImage(with: imageURL)
        titleLabel.text = movie.title
        rateLabel.text = "\(movie.voteAverage)"
    }
}
