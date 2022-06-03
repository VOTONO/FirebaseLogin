//
//  LoginService.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import Foundation
import Combine
import FirebaseAuth

protocol LoginServiceProtocol {
    func login(with: UserLogin) -> AnyPublisher<Void, Error>
}

class LoginService: LoginServiceProtocol {
    
    
    
    func login(with user: UserLogin) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth
                
                    .auth()
                    .signIn(withEmail: user.email ,
                            password: user.password) { result, error in
                        
                        if let error = error {
                            promise(.failure(error))
                        } else {
                            promise(.success(()))
                        }
                    }
            }
            
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
