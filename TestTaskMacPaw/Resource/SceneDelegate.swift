//
//  SceneDelegate.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit
import AVFAudio


class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    let audioPlayer = AudioPlayer()
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: MainMenu())
        window?.rootViewController = navigationController
        
        navigationController.navigationBar.tintColor = .black
        navigationController.setNavigationBarHidden(false, animated: true)
        window?.makeKeyAndVisible()
        
        navigationController.navigationBar.tintColor = .black
        let selectedColor: MyColors = .superViewBackgroundColor
        window?.backgroundColor = selectedColor.color
        audioPlayer.playAudio()
    }
}

