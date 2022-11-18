//
//  SceneDelegate.swift
//  WorkoutTracker
//
//  Created by Павел Яковенко on 04.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ProfileViewController()
        window?.makeKeyAndVisible()
    }
}
//MainTabBarController
//StartWorkoutViewController
//ProfileViewController
