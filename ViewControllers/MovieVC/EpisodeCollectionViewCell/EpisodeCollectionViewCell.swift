//
//  EpisodeCollectionViewCell.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/23/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var runTimeView: UIView!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!

    @IBOutlet weak var viLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        episodeLabel.textColor = UIColor.white
        viLabel.textColor = UIColor.white
        thumbnailImageView.layer.cornerRadius = CGFloat(CornerValue.default)
        thumbnailImageView.clipsToBounds = true
        runTimeView.layer.cornerRadius = CGFloat(CornerValue.default / 2)
        runTimeView.clipsToBounds = true
    }

}
