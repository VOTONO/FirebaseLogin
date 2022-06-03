//
//  LoginViewModel.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation
import SwiftUI
import Combine

enum LoginState {
    case success
    case failed(error: Error)
    case na
}

protocol LoginViewModelProtocol {
    func login()
    var service: LoginServiceProtocol {get}
    var state: LoginState {get}
    var userLogin: UserLogin {get}
    init(service: LoginServiceProtocol)
}


class LoginViewModel: ObservableObject, LoginViewModelProtocol {

    var service: LoginServiceProtocol
    
    @Published var userLogin: UserLogin = UserLogin(email: "", password: "")
    @Published var state: LoginState = LoginState.na
    
    private var subscriptions = Set<AnyCancellable>()
    
    required init(service: LoginServiceProtocol) {
        self.service = service
    }
    
    func login() {
        
        service
            .login(with: userLogin)
            .sink { result in
                
                switch result {
                case .failure(let error):
                    print("Fail login with error: \(error)")
                    self.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                print("Succes login user: \(self?.userLogin)")
                self?.state = .success
            }
            .store(in: &subscriptions)
        
    }
}
