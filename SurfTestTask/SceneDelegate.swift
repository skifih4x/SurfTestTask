//
//  SceneDelegate.swift
//  SurfTestTask
//
//  Created by Артем Орлов on 13.02.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowsScene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}

