//
//  ColorsViewController.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

struct Color {
    let name: String
    let color: UIColor
}

class ColorsViewController: UIViewController {
    
    let colors: [Color]
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .gridLayout())
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    init() {
        colors = [Color(name: "System Red", color: .systemRed),
                  Color(name: "System Green", color: .systemGreen),
                  Color(name: "System Blue", color: .systemBlue),
                  Color(name: "System Orange", color: .systemOrange),
                  Color(name: "System Yellow", color: .systemYellow),
                  Color(name: "System Pink", color: .systemPink),
                  Color(name: "System Purple", color: .systemPurple),
                  Color(name: "System Teal", color: .systemTeal),
                  Color(name: "System Indigo", color: .systemIndigo),
                  Color(name: "System Gray", color: .systemGray),
                  Color(name: "System Gray 2", color: .systemGray2),
                  Color(name: "System Gray 3", color: .systemGray3),
                  Color(name: "System Gray 4", color: .systemGray4),
                  Color(name: "System Gray 5", color: .systemGray5),
                  Color(name: "System Gray 6", color: .systemGray6),
                  Color(name: "Label", color: .label),
                  Color(name: "Secondary Label", color: .secondaryLabel),
                  Color(name: "Tertiary Label", color: .tertiaryLabel),
                  Color(name: "Quaternary Label", color: .quaternaryLabel),
                  Color(name: "Link", color: .link),
                  Color(name: "Placeholder Text", color: .placeholderText),
                  Color(name: "Separator", color: .separator),
                  Color(name: "Opaque Separator", color: .opaqueSeparator),
                  Color(name: "System Background", color: .systemBackground),
                  Color(name: "Secondary System Background", color: .secondarySystemBackground),
                  Color(name: "Tertiary System Background", color: .tertiarySystemBackground),
                  Color(name: "System Grouped Background", color: .systemGroupedBackground),
                  Color(name: "Secondary System Grouped Background", color: .secondarySystemGroupedBackground),
                  Color(name: "Tertiary System Grouped Background", color: .tertiarySystemGroupedBackground),
                  Color(name: "System Fill", color: .systemFill),
                  Color(name: "Secondary System Fill", color: .secondarySystemFill),
                  Color(name: "Tertiary System Fill", color: .tertiarySystemFill),
                  Color(name: "Quaternary System Fill", color: .quaternarySystemFill)
        ]
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
        
        let segmentedControl = UISegmentedControl(items: ["Light", "Dark"])
        segmentedControl.addTarget(self, action: #selector(switchTheme(_:)), for: .valueChanged)
        self.navigationItem.titleView = segmentedControl
        segmentedControl.selectedSegmentIndex = 0
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    @objc private func switchTheme(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            overrideUserInterfaceStyle = .light
        case 1:
            overrideUserInterfaceStyle = .dark
        default:
            fatalError("Invalid Index")
        }
    }
}

extension ColorsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.reuseID, for: indexPath) as? ColorCell else {
            return UICollectionViewCell()
        }
        
        cell.populate(with: colors[indexPath.row])
        return cell
    }
}

