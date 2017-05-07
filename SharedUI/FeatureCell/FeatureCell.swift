//
//  FeatureCell.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/19/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class FeatureCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var avatarImgHeightConstr: NSLayoutConstraint!
    
    @IBOutlet weak var avatarImgWidthConstr: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
