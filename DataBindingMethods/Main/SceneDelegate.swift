//
//  SceneDelegate.swift
//  DataBindingMethods
//
//  Created by David Molina on 27/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setInitialController(to: windowScene)
    }

}

@available(iOS 13, *)
private extension SceneDelegate {
    
    private func setInitialController(to windowScene: UIWindowScene) {
            window = UIWindow(windowScene: windowScene)
            window?.makeKeyAndVisible()
            let viewModel = DelegatePatternViewModel()
        let navigationController = UINavigationController(rootViewController: DelegatePatternViewController(viewModel: viewModel))
            window?.rootViewController = navigationController
            return
    }
    
}

