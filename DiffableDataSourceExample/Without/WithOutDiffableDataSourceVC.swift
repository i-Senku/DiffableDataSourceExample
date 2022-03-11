//
//  WithOutDiffableDataSourceVC.swift
//  DiffableDataSourceExample
//
//  Created by Ercan Garip on 11.03.2022.
//

import UIKit
import TinyConstraints

final class WithOutDiffableDataSourceVC: UIViewController {
    
    private let viewModel = WithOutDiffableViewModel()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - Actions
extension WithOutDiffableDataSourceVC {
    
    @objc
    private func addButtonTapped() {
        viewModel.addItem()
        tableView.reloadData()
    }
    
    @objc
    private func removeButtonTapped() {
        viewModel.removeItem()
        tableView.reloadData()
    }
}

// MARK: - UILayout
extension WithOutDiffableDataSourceVC {
    
    private func addSubViews() {
        addTableView()
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.edgesToSuperview()
    }
}

// MARK: - Configure
extension WithOutDiffableDataSourceVC {
    
    private func configureContents() {
        title = "Without DiffableDataSource"
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addButtonTapped)),
            UIBarButtonItem(image: .remove, style: .plain, target: self, action: #selector(removeButtonTapped))
        ]
    }
}

// MARK: -
extension WithOutDiffableDataSourceVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(viewModel.cellItemAt(indexPath: indexPath))
        return cell
    }
}
