//
//  RegostrationCoordinator.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import UIKit
import SwiftUI

class RegisterCoordinator: Coordinator {
    var rootViewController = UIViewController()
    
    func start() {
        let view = RegisterView(viewModel: RegisterViewModel(registerService: RegisterService()),
                                formBuilder: RegisterFormBuilder())
        rootViewController = UIHostingController(rootView: view)
    }
}
