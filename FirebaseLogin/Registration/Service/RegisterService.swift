//
//  RegisterService.swift
//  FirebaseLogin
//
//  Created by Mac User on 30.05.2022.
//

import Foundation
import Firebase
import FirebaseDatabase
import Combine

enum RegisterKeys: String {
    case firstName
    case lastName
    case birthday
}

protocol RegisterServiceProtocol {
    func register(with user: UserDetails) -> AnyPublisher<Void, Error>
}

final class RegisterService: RegisterServiceProtocol {
    
    func register(with user: UserDetails) -> AnyPublisher<Void, Error> {
        
        Deferred {
            
            Future { promise in
                
                Auth.auth()
                    .createUser(withEmail: user.email, password: user.password) { result, error in
                        if let error = error{
                            promise(.failure(error))
                            print(error.localizedDescription)
                        } else {
                            if let uid = result?.user.uid {
                                
                                let values = [RegisterKeys.firstName.rawValue: user.firstName,
                                              RegisterKeys.lastName.rawValue: user.lastName,
                                              RegisterKeys.birthday.rawValue: user.birthday] as [String : Any]
                                
                                Database.database()
                                        .reference()
                                        .child("users")
                                        .child(uid)
                                        .updateChildValues(values) { error, _ in
                                            if let error = error {
                                                promise(.failure(error))
                                            } else {
                                                promise(.success(()))
                                            }
                                        }
                                
                                
                            } else {
                                promise(.failure(NSError(domain: "Invalide User ID", code: 0)))
                            }
                        }
                    }
                
            }
            
        }
        .receive(on: RunLoop.main)
        .eraseToAnyPublisher()
    }
    
}
