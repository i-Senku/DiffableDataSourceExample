//
//  WithDiffableViewModel.swift
//  DiffableDataSourceExample
//
//  Created by Ercan Garip on 11.03.2022.
//

import UIKit

class WithDiffableViewModel {
    
    private var snapshot = NSDiffableDataSourceSnapshot<DiffableSection, DiffableItem>()
    
    private var dataSource: UITableViewDiffableDataSource<DiffableSection, DiffableItem>!
    
    private var items = [
        DiffableItem(title: 1),
        DiffableItem(title: 2),
        DiffableItem(title: 3),
        DiffableItem(title: 4)
    ]
    
    private func setupTableViewDataSource(tableView: UITableView) {
        dataSource = UITableViewDiffableDataSource<DiffableSection, DiffableItem>(
            tableView: tableView) { tableView, indexPath, itemIdentifier in
                let cell = UITableViewCell()
                cell.textLabel?.text = String(itemIdentifier.title)
                return cell
            }
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        updateDataSource()
    }
    
    func viewDidLoad(tableView: UITableView) {
        setupTableViewDataSource(tableView: tableView)
    }
    
    func addItem() {
        let newItem = DiffableItem(title: Int.random(in: 1...100))
        items.append(newItem)
        snapshot.appendItems([newItem])
        updateDataSource()
    }
    
    func removeItem() {
        if !items.isEmpty {
            let removed = items.remove(at: Int.random(in: 0..<items.count))
            snapshot.deleteItems([removed])
            updateDataSource()
        }
    }
    
    private func updateDataSource() {
        dataSource.apply(snapshot)
    }
}
