//
//  Coordinator.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

class Coordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func showColors() {
        let colorsViewController = ColorsViewController()
        navigationController.pushViewController(colorsViewController, animated: true)
    }

    func showEffects() {
        let effectsViewController = EffectsViewController()
        navigationController.pushViewController(effectsViewController, animated: true)
    }

    func showSymbols() {
        let symbolViewController = SymbolsViewController(symbols: symbols)
        navigationController.pushViewController(symbolViewController, animated: true)
    }
}
