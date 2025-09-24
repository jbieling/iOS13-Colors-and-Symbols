//
//  CornerRadiusViewController.swift
//  System Colors
//
//  Created by Jakob Bieling on Nov/11/19.
//  Copyright © 2019 Jakob Bieling. All rights reserved.
//

import UIKit

class CornerRadiusViewController : UIViewController {

    let stepSize : Float = 0.5

    let roundedView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .systemBackground
        v.layer.masksToBounds = true;
        return v
    }()

    let radiusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 80, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let radiusSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        roundedView.backgroundColor = .systemRed
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        radiusSlider.minimumValue = 0.0
        radiusSlider.maximumValue = 100.0 / stepSize
        radiusSlider.isContinuous = true
        radiusSlider.addTarget(self, action: #selector(setRadius), for: .valueChanged)

        self.setConstraints()

        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }

    @objc private func setRadius() {
        let newValue = round(radiusSlider.value) * stepSize

        radiusLabel.text = String(newValue) + "px"
        roundedView.layer.cornerRadius = CGFloat(newValue)
    }

    private func setConstraints() {
        view.addSubview(roundedView)
        roundedView.topAnchor.constraint(equalTo: view.centerYAnchor, constant:  -100).isActive = true
        roundedView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant:  100).isActive = true
        roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  16).isActive = true
        roundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -16).isActive = true

        view.addSubview(radiusLabel)
        radiusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        radiusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        radiusLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        radiusLabel.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor).isActive = true

        view.addSubview(radiusSlider)
        radiusSlider.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        radiusSlider.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        radiusSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        radiusSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
    }
}
