//
//  RegisterViewModel.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation
import SwiftUI
import Combine

enum RegisterState {
    case success
    case fail(error: Error)
    case no
}

protocol RegisterViewModelProtocol {
    
    var service: RegisterServiceProtocol {get}
    
    var registerState: RegisterState {get}
    var userDetails: UserDetails {get}
    
    func register()
    init(registerService: RegisterServiceProtocol)
}

final class RegisterViewModel: ObservableObject, RegisterViewModelProtocol {
    
    let service: RegisterServiceProtocol
    
    var registerState: RegisterState = .no
    @Published var userDetails = UserDetails.new
    
    private var subscriprions = Set<AnyCancellable>()
    
    init(registerService: RegisterServiceProtocol) {
        self.service = registerService
    }
    
    func register() {
        
        service
            .register(with: userDetails)
            .sink { [weak self] result in
                
                switch result {
                case .failure(let error):
                    self?.registerState = .fail(error: error)
                default: break
                }
                
            } receiveValue: { [weak self] in
                self?.registerState = .success
            }
            .store(in: &subscriprions)
    }
    
    
    
}
