//
//  HomeViewController.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/18/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellNib(cellClass: ContainerTableViewCell.self)
        tableView.registerHeaderFooterViewNib(viewClass: TitleCell.self)
        blueNavigationBar()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeViewController: UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(aClass: ContainerTableViewCell.self, forIndexPath: indexPath)
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        return cell
    }

}

extension HomeViewController: UITableViewDelegate {

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeue(aClass: TitleCell.self)
        switch section {
        case 1:
            headerView.titleLabel.text = "Popular Global TV Shows"
        case 2:
            headerView.titleLabel.text = "Top Picks For You"
        case 3:
            headerView.titleLabel.text = "On Air Titles"
        case 4:
            headerView.titleLabel.text = "Collections by Viki"
        case 5:
            headerView.titleLabel.text = "Fan Collections"
        default:
            headerView.titleLabel.text = ""
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? ContainerTableViewCell else {
            return
        }
        cell.collectionView.reloadData()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? CGFloat(CellHeight.Minimun) : CGFloat(CellHeight.Default)
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(CellHeight.Minimun)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? CGFloat(CellHeight.Slider) : CGFloat(CellHeight.Container)
    }
    
}

extension HomeViewController: UICollectionViewDataSource {

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(aClass: FeatureCell.self, forIndexPath: indexPath)
        return cell
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {

    // MARK: - UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height * 1.7, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
}
