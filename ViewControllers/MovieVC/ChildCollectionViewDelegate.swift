//
//  ChildCollectionViewDelegate.swift
//  movie-ios-project
//
//  Created by XuanChien on 5/2/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

protocol ChildCollectionViewProtocol {
    func collectionViewSelected(_ collectionView: UICollectionView, indexPathFor collectionViewItem: IndexPath)
}

class ChildCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {

    var delegate: ChildCollectionViewProtocol?

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.collectionViewSelected(collectionView, indexPathFor: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let insets = collectionView.contentInset.left + collectionView.contentInset.right
        let width = collectionView.frame.width - insets
        switch collectionView.tag {
        case 1:
            let width = (collectionView.bounds.width - insets - CGFloat(Margin.default) * 2) / 2
            return CGSize(width: width, height: width)
        case 2:
            return CGSize(width: width, height: width * 90 / 194 + 100)
        default:
            return CGSize(width: width, height: width * 90 / 194 + 48)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 35)

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Margin.default)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Margin.default)
    }

}
