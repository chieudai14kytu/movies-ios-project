//
//  ChildCollectionViewDataSource.swift
//  movie-ios-project
//
//  Created by XuanChien on 5/2/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class ChildCollectionViewDataSource: NSObject, UICollectionViewDataSource {

    var testData: [BaseModel]!

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView.tag {
        case 0:
            return 2
        case 1, 2, 3:
            return 1
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return 1
        case 1,2,3:
            return testData.count
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeue(aClass: EpisodeCollectionViewCell.self, forIndexPath: indexPath)
            return cell
        case 1:
            let cell = collectionView.dequeue(aClass: CastCollectionViewCell.self, forIndexPath: indexPath)
            return cell
        case 2:
            let cell = collectionView.dequeue(aClass: ReviewCollectionViewCell.self, forIndexPath: indexPath)
            return cell
        case 3:
            let cell = collectionView.dequeue(aClass: EpisodeCollectionViewCell.self, forIndexPath: indexPath)
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeue(aClass: TitleCollectionReusableView.self, ofKind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
        switch collectionView.tag {
        case 0:
            if indexPath.section == 0 {
                headerView.titleLabel.text = "Start Watching"
            } else if indexPath.section == 1 {
                headerView.titleLabel.text = "All Episode"
            } else {
                headerView.titleLabel.text = ""
            }
        case 1:
            headerView.titleLabel.text = "Cast"
        case 2:
            headerView.titleLabel.text = "Reviews"
        case 3:
            headerView.titleLabel.text = "Related Clips"
        default:
            headerView.titleLabel.text = ""
        }
        return headerView
    }
}
