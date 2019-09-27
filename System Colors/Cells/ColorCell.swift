//
//  ColorsCell.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

extension UIColor {
    func hexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)
        return NSString(format:"#%02x%02x%02x", (Int(r) & 255), (Int(g) & 255), (Int(b) & 255)) as String
    }
}

class ColorCell: UICollectionViewCell {
    static let reuseID = "ColorCell"
    
    let colorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let backgroundPatternView: UIView = {
        let view = CheckerView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

        insertSubview(backgroundPatternView, belowSubview: colorView)
        backgroundPatternView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundPatternView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundPatternView.heightAnchor.constraint(equalTo: colorView.heightAnchor).isActive = true
        backgroundPatternView.widthAnchor.constraint(equalTo: colorView.widthAnchor, multiplier: 0.5).isActive = true

        addSubview(valueLabel)
        valueLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        valueLabel.heightAnchor.constraint(equalTo: colorView.heightAnchor).isActive = true
        valueLabel.widthAnchor.constraint(equalTo: colorView.widthAnchor).isActive = true

        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: 0).isActive = true
    }
    
    func populate(with color: Color) {
        colorView.backgroundColor = color.color
        valueLabel.text = color.color.resolvedColor(with: self.traitCollection).hexString()
        valueLabel.sizeToFit()
        nameLabel.text = color.name
        nameLabel.sizeToFit()
    }
}
