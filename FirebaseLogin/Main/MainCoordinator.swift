//
//  MainCoordinator.swift
//  FirebaseLogin
//
//  Created by Mac User on 02.06.2022.
//

import Foundation
import UIKit
import SwiftUI

class MainCoordinator: Coordinator {
    
    var rootViewController = UITabBarController()
    
    var childCoordinators: [Coordinator] = []
    
    
    func start() {
        
        let greetengCoordinator = GreetingCoordinator()
        greetengCoordinator.start()
        self.childCoordinators.append(greetengCoordinator)
        let greetengVC = greetengCoordinator.rootViewController
        setupTabBar(vc: greetengVC, title: "Greeting", imageName: "hand.raised", selectetImageName: "hand.raised.fill")
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.start()
        self.childCoordinators.append(profileCoordinator)
        
        self.rootViewController.viewControllers = [greetengCoordinator.rootViewController,
                                                   profileCoordinator.rootViewController]
        let profileVC = profileCoordinator.rootViewController
        setupTabBar(vc: profileVC, title: "Profile", imageName: "person.crop.circle", selectetImageName: "person.crop.circle.fill")
    }

    
    private func setupTabBar(vc: UIViewController, title: String, imageName: String, selectetImageName: String) {
        let defaultImage = UIImage(systemName: imageName)
        let selectedImage = UIImage(systemName: selectetImageName)
        let tabBarItem = UITabBarItem(title: title, image: defaultImage, selectedImage: selectedImage)
        vc.tabBarItem = tabBarItem
    }
}
