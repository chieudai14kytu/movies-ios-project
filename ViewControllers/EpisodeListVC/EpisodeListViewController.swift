//
//  EpisodeListViewController.swift
//  movie-ios-project
//
//  Created by XuanChien on 5/1/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let margin = CGFloat(Margin.default)

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerCellNib(cellClass: EpisodeCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        let insets = collectionView.contentInset
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        let availableWidth = collectionView.frame.width - CGFloat(Margin.default) - insets.left - insets.right
        let itemWidth = availableWidth / 2
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 0.6)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didTapCancelButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }

}

extension EpisodeListViewController: UICollectionViewDataSource {

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(aClass: EpisodeCollectionViewCell.self, forIndexPath: indexPath)
        return cell
    }

}

extension EpisodeListViewController: UICollectionViewDelegate {

    // MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
    }
    
}










