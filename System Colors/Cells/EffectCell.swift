//
//  SymbolCell.swift
//  System Colors
//
//  Created by Jakob Bieling on 26/Sep/19.
//  Copyright © 2019 Jakob Bieling. All rights reserved.
//

import UIKit

class EffectCell: UICollectionViewCell {
    static let reuseID = "EffectCell"
    
    let effectView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        return view
    }()

    let backgroundPatternView: UIView = {
        let view = CheckerView()
        view.numberOfChecks = 2
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        addSubview(effectView)
        effectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        effectView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        effectView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        effectView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        insertSubview(backgroundPatternView, belowSubview: effectView)
        backgroundPatternView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundPatternView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundPatternView.heightAnchor.constraint(equalTo: effectView.heightAnchor).isActive = true
        backgroundPatternView.widthAnchor.constraint(equalTo: effectView.widthAnchor).isActive = true

        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: effectView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func populate(with effect: Effect) {
        effectView.effect = effect.effect
        nameLabel.text = effect.name
    }
}
