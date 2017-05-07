//
//  ContainerTableViewCell.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/25/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.registerCellNib(cellClass: FeatureCell.self)
    }
    
}
