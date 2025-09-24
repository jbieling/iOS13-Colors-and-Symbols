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
    let effect: UIVisualEffect

    init(name: String, blurStyle: UIBlurEffect.Style)
    {
        self.name = name
        self.effect = UIBlurEffect(style: blurStyle)
    }

    @available(iOS 26.0, *)
    init(name: String, glassStyle: UIGlassEffect.Style)
    {
        self.name = name
        self.effect = UIGlassEffect(style: glassStyle)
    }
}

class EffectsViewController: UIViewController {
    
    var effects: [Effect]

    private var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .gridLayout())
        collectionView.register(EffectCell.self, forCellWithReuseIdentifier: EffectCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    init() {

        effects = [ Effect(name: "Light", blurStyle: .light),
                    Effect(name: "Extra Light", blurStyle: .extraLight),
                    Effect(name: "Light", blurStyle: .light),
                    Effect(name: "Dark", blurStyle: .dark),
                    Effect(name: "Regular", blurStyle: .regular),
                    Effect(name: "Prominent", blurStyle: .prominent),
                    Effect(name: "System UltraThin Material", blurStyle: .systemUltraThinMaterial),
                    Effect(name: "System Thin Material", blurStyle: .systemThinMaterial),
                    Effect(name: "System  Material", blurStyle: .systemMaterial),
                    Effect(name: "System Thick Material", blurStyle: .systemThickMaterial),
                    Effect(name: "System Chrome Material", blurStyle: .systemChromeMaterial),
                    Effect(name: "System Ultra Thin  Material Light", blurStyle: .systemUltraThinMaterialLight),
                    Effect(name: "System Thin Material Light", blurStyle: .systemThinMaterialLight),
                    Effect(name: "System Material Light", blurStyle: .systemMaterialLight),
                    Effect(name: "System Thick Material Light", blurStyle: .systemThickMaterialLight),
                    Effect(name: "System Chrome Material Light", blurStyle: .systemChromeMaterialLight),
                    Effect(name: "System Ultra Thin Material Dark", blurStyle: .systemUltraThinMaterialDark),
                    Effect(name: "System Thin Material Dark", blurStyle: .systemThinMaterialDark),
                    Effect(name: "System Material Dark", blurStyle: .systemMaterialDark),
                    Effect(name: "System Thick Material Dark", blurStyle: .systemThickMaterialDark),
                    Effect(name: "System Chrome Material Dark", blurStyle: .systemChromeMaterialDark)
            ]
        if #available(iOS 26.0, *)
        {
            effects.insert(Effect(name: "Clear Glass", glassStyle: .clear), at: 0)
            effects.insert(Effect(name: "Glass", glassStyle: .regular), at: 0)

        }
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

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.collectionView.reloadItems(at: self.collectionView.indexPathsForVisibleItems)
        }
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

