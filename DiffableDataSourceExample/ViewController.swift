//
//  ViewController.swift
//  DiffableDataSourceExample
//
//  Created by Ercan Garip on 11.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushToWith(_ sender: Any) {
        let viewController = WithDiffableDataSourceVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func withOutDiffable(_ sender: Any) {
        let viewController = WithOutDiffableDataSourceVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

