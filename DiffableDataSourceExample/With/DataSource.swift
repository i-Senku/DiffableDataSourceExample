//
//  DataSource.swift
//  DiffableDataSourceExample
//
//  Created by Ercan Garip on 11.03.2022.
//

import Foundation

enum DiffableSection {
    case main
}

struct DiffableItem: Hashable {
    let id = UUID()
    let title: Int
}
