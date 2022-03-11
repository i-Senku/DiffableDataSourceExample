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
    
    private lazy var dataSource = UITableViewDiffableDataSource<DiffableSection, DiffableItem>(tableView: tableView) { tableView, indexPath, itemIdentifier in
        let cell = UITableViewCell()
        cell.textLabel?.text = String(itemIdentifier.title)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
}

// MARK: - Actions
extension WithDiffableDataSourceVC {
    
    @objc
    private func addButtonTapped() {
        viewModel.addItem()
        updateDataSource()
    }
    
    @objc
    private func removeButtonTapped() {
        viewModel.removeItem()
        updateDataSource()
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
        updateDataSource()
    }
    
    private func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<DiffableSection, DiffableItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.items, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

