//
//  SceneDelegate.swift
//  System Colors
//
//  Created by Eduardo Moll on 8/18/19.
//  Copyright © 2019 eduardo moll. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        let coordinator = Coordinator(navigationController: navController)
        coordinator.start()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

