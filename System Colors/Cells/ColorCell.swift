//
//  ColorsCell.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {
    static let reuseID = "ColorCell"
    
    let colorView: UIView = {
        let view = UIView()
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
        addSubview(colorView)
        colorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        colorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        colorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func populate(with color: Color) {
        colorView.backgroundColor = color.color
        nameLabel.text = color.name
        nameLabel.sizeToFit()
    }
}
