//
//  FirstTabCoordinator.swift
//  FirebaseLogin
//
//  Created by Mac User on 02.06.2022.
//

import Foundation
import UIKit
import SwiftUI


class GreetingCoordinator: Coordinator {
    
    var rootViewController = UINavigationController()
    
    lazy var greetingView: GreetingView = {
        let view = GreetingView(viewModel: GreetingViewModel())
        return view
    }()
    
    func start() {
        
        rootViewController.setViewControllers([UIHostingController(rootView: greetingView)], animated: false)
            
    }
}
