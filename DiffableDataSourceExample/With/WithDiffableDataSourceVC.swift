//
//  WithDiffableDataSourceVC.swift
//  DiffableDataSourceExample
//
//  Created by Ercan Garip on 11.03.2022.
//

import UIKit
import TinyConstraints

final class WithDiffableDataSourceVC: UIViewController {
    
    private let viewModel = WithDiffableViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        viewModel.viewDidLoad(tableView: tableView)
    }
}

// MARK: - Actions
extension WithDiffableDataSourceVC {
    
    @objc
    private func addButtonTapped() {
        viewModel.addItem()
    }
    
    @objc
    private func removeButtonTapped() {
       viewModel.removeItem()
    }
}

// MARK: - UILayout
extension WithDiffableDataSourceVC {
    
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
}

// MARK: - Configure
extension WithDiffableDataSourceVC {
    
    private func configureContents() {
        title = "With DiffableDataSource"
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButtonTapped)),
            UIBarButtonItem(image: .remove, style: .plain, target: self, action: #selector(removeButtonTapped))
        ]
    }
}

