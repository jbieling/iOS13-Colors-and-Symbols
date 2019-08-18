//
//  SymbolCell.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

class SymbolCell: UICollectionViewCell {
    static let reuseID = "SymbolCell"
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
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
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func populate(with symbol: String) {
        imageView.image = UIImage(systemName: symbol)
        nameLabel.text = symbol
    }
}
