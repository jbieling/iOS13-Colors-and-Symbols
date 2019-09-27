//
//  EffectsViewController.swift
//  System Colors
//
//  Created by Jakob Bieling on 26/Sep/19.
//  Copyright © 2019 Jakob Bieling. All rights reserved.
//

import UIKit

struct Effect {
    let name: String
    let style: UIBlurEffect.Style
}

class EffectsViewController: UIViewController {
    
    let effects: [Effect]
    
    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .gridLayout())
        collectionView.register(EffectCell.self, forCellWithReuseIdentifier: EffectCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    init() {

        effects = [ Effect(name: "Extra Light", style: .extraLight),
                    Effect(name: "Light", style: .light),
                    Effect(name: "Dark", style: .dark),
                    Effect(name: "Regular", style: .regular),
                    Effect(name: "Prominent", style: .prominent),
                    Effect(name: "System UltraThin Material", style: .systemUltraThinMaterial),
                    Effect(name: "System Thin Material", style: .systemThinMaterial),
                    Effect(name: "System  Material", style: .systemMaterial),
                    Effect(name: "System Thick Material", style: .systemThickMaterial),
                    Effect(name: "System Chrome Material", style: .systemChromeMaterial),
                    Effect(name: "System Ultra Thin  Material Light", style: .systemUltraThinMaterialLight),
                    Effect(name: "System Thin Material Light", style: .systemThinMaterialLight),
                    Effect(name: "System Material Light", style: .systemMaterialLight),
                    Effect(name: "System Thick Material Light", style: .systemThickMaterialLight),
                    Effect(name: "System Chrome Material Light", style: .systemChromeMaterialLight),
                    Effect(name: "System Ultra Thin Material Dark", style: .systemUltraThinMaterialDark),
                    Effect(name: "System Thin Material Dark", style: .systemThinMaterialDark),
                    Effect(name: "System Material Dark", style: .systemMaterialDark),
                    Effect(name: "System Thick Material Dark", style: .systemThickMaterialDark),
                    Effect(name: "System Chrome Material Dark", style: .systemChromeMaterialDark)
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

        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }
}

extension EffectsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return effects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EffectCell.reuseID, for: indexPath) as? EffectCell else {
            return UICollectionViewCell()
        }
        
        cell.populate(with: effects[indexPath.row])
        return cell
    }
}

