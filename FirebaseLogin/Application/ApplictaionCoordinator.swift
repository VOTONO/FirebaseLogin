//
//  ApplictaionCoordinator.swift
//  FirebaseLogin
//
//  Created by Mac User on 30.05.2022.
//

import UIKit
import SwiftUI
import Combine

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    @ObservedObject var sessionService = SessionService()
    var childCoordinators = [Coordinator]()
    
    let isUserLoggedIn = CurrentValueSubject<Bool,Never>(false)
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        
        setupLoggedInValue()
        
        isUserLoggedIn
            .removeDuplicates()
            .sink { [weak self] loggedIn in
            guard let self = self else {return}
            if loggedIn {
                let mainCoordinator = MainCoordinator()
                mainCoordinator.start()
                self.childCoordinators = [mainCoordinator]
                self.window.rootViewController = mainCoordinator.rootViewController
            }else {
                let loginCoordinator = LoginCoordinator()
                loginCoordinator.start()
                self.childCoordinators = [loginCoordinator]
                self.window.rootViewController = loginCoordinator.rootViewController
            }
            
        }.store(in: &subscriptions)
    }
    
    func setupLoggedInValue() {
        let key = "isUserLoggedIn"
        //let value = UserDefaults.standard.bool(forKey: key)
        let value: Bool = {
            switch sessionService.state {
            case .loggedIn:
                return true
            case .loggedOut:
                return false
            }
        }()
        
        isUserLoggedIn.send(value)
        
        isUserLoggedIn
            .filter({ $0 })
            .sink { value in
                UserDefaults.standard.setValue(value, forKey: key)
            }
            .store(in: &subscriptions)
    }
}
