//
//  MainViewController.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

struct MainMenuOption {
    let title: String
}

class MainViewController: UIViewController {
    
    let coordinator: Coordinator
    
    let options: [MainMenuOption] = [
        MainMenuOption(title: "Colors"),
        MainMenuOption(title: "Symbols")
    ]
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .listLayout())
        collectionView.register(SingleLabelCell.self, forCellWithReuseIdentifier: SingleLabelCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
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
        navigationItem.title = "Main Menu"
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleLabelCell.reuseID, for: indexPath) as? SingleLabelCell else {
            return UICollectionViewCell()
        }
        cell.label.text = options[indexPath.row].title
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            coordinator.showColors()
        } else {
            coordinator.showSymbols()
        }
    }
}
