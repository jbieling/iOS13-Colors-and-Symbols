//
//  SymbolsViewController.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

class SymbolsViewController: UIViewController {
    
    let symbols: [String]
    private var filterdSymbols: [String] = []
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .gridLayout())
        collectionView.register(SymbolCell.self, forCellWithReuseIdentifier: SymbolCell.reuseID)
        collectionView.register(SearchView.self, forSupplementaryViewOfKind: "header", withReuseIdentifier: "header")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.keyboardDismissMode = .onDrag
        return collectionView
    }()
    
    private var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    init(symbols: [String]) {
        self.symbols = symbols
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = collectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        navigationItem.titleView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.obscuresBackgroundDuringPresentation = false
    }
}

extension SymbolsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filterdSymbols = symbols.filter { $0.lowercased().contains(text.lowercased()) }
        collectionView.reloadData()
    }
}

extension SymbolsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchController.isActive ? filterdSymbols.count : symbols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SymbolCell.reuseID, for: indexPath) as? SymbolCell else {
            return UICollectionViewCell()
        }
        
        let symbol = searchController.isActive ? filterdSymbols[indexPath.row] : symbols[indexPath.row]
        cell.populate(with: symbol)
        return cell
    }
}
