//
//  CastViewController.swift
//  movie-ios-project
//
//  Created by XuanChien on 4/18/17.
//  Copyright © 2017 XuanChien. All rights reserved.
//

import UIKit

class CastViewController: UIViewController {

    var castId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(<#T##cellClass: T.Type##T.Type#>)

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

// MARK: - UITableViewDataSource


//extension CastViewController: UITableViewDataSource {
//
//}

// MARK: - UITableViewDelegate

//extension CastViewController: UITableViewDelegate {
//    
//}
