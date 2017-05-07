//
//  CastCollectionViewCell.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/29/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var castNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        castImageView.layer.cornerRadius = CGFloat(CornerValue.default)
        castImageView.clipsToBounds = true
    }

}
