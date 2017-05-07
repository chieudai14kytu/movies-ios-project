//
//  MainCollectionViewCell.swift
//  movie-ios-project
//
//  Created by XuanChien on 5/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!

    var collectionViewDataSource: UICollectionViewDataSource!
    var collectionViewDelegate: UICollectionViewDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 4.0
        backView.clipsToBounds = true
    }

    @IBAction func didTapMoreButton(_ sender: UIButton) {
    }

    func setCollectionView(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate, forRow row: Int) {
        collectionViewDataSource = dataSource
        collectionViewDelegate = delegate
        collectionView.registerCellNib(cellClass: EpisodeCollectionViewCell.self)
        collectionView.registerCellNib(cellClass: CastCollectionViewCell.self)
        collectionView.registerCellNib(cellClass: ReviewCollectionViewCell.self)
        collectionView.registerReusableViewNib(viewClass: TitleCollectionReusableView.self, ofKind: UICollectionElementKindSectionHeader)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: CGFloat(Margin.default), bottom: CGFloat(Margin.default), right: CGFloat(Margin.default))
        collectionView.tag = row
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.reloadData()

    }

}








