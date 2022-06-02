//
//  SessionService.swift
//  FirebaseLogin
//
//  Created by Mac User on 30.05.2022.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase

enum SessionState {
    case loggedIn
    case loggedOut
}

protocol SessionServiceProtocol {
    var state: SessionState {get}
    var userDetails: SessionUserDetails? {get}
    func logout()
}

final class SessionService: ObservableObject, SessionServiceProtocol {
    
    @Published var state: SessionState = .loggedOut

    @Published var userDetails: SessionUserDetails?

    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        setupFireBaseAuthHandler()
    }
    
    func logout() {
        try? Auth.auth().signOut()
    }
}

extension SessionService {
    
    func setupFireBaseAuthHandler() {
        handler = Auth
            .auth()
            .addStateDidChangeListener({ [weak self] result, user in
                guard let self = self else {return}
                self.state = user == nil ? .loggedOut : .loggedIn
            })
    }
    
    func handleRefresh(with uid: String) {
        
        Database
            .database()
            .reference()
            .child("users")
            .child(uid)
            .observe(.value) { [weak self] snapshot in
                
                guard let self = self,
                      let value = snapshot.value as? NSDictionary,
                      let firstname = value[RegisterKeys.firstName.rawValue] as? String,
                      let lastname = value[RegisterKeys.lastName.rawValue] as? String else {return}
                
                DispatchQueue.main.async {
                    self.userDetails = SessionUserDetails(firstname: firstname, lastname: lastname)
                }
            }
            
        
    }
}

