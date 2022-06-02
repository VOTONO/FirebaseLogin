//
//  Login Coordinator.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI
import Combine

class LoginCoordinator: Coordinator {
    
    var rootViewController = UIViewController()
    
    func start() {
        let view = LoginView(viewModel: LoginViewModel())
        rootViewController = UIHostingController(rootView: view)
    }
}
