//
//  ProfileTabCoordinator.swift
//  FirebaseLogin
//
//  Created by Mac User on 02.06.2022.
//

import Foundation
import UIKit
import SwiftUI


class ProfileCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var profileView: ProfileView = {
        let view = ProfileView(viewModel: ProfileViewModel())
        return view
    }()
    
    func start() {
        rootViewController.setViewControllers([UIHostingController(rootView: profileView)], animated: false)
    }
    
}
