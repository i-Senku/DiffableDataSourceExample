//
//  WithDiffableViewModel.swift
//  DiffableDataSourceExample
//
//  Created by Ercan Garip on 11.03.2022.
//

import Foundation

class WithDiffableViewModel {
    var items = [
        DiffableItem(title: 1),
        DiffableItem(title: 2),
        DiffableItem(title: 3),
        DiffableItem(title: 4)
    ]
    
    func addItem() {
        items.append(DiffableItem(title: Int.random(in: 1...100)))
    }
    
    func removeItem() {
        if !items.isEmpty {
            items.remove(at: Int.random(in: 0..<items.count))
        }
    }
}
