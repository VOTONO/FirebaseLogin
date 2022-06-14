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
    var sessionState: SessionState {get}
    var isConnectingServer: Bool {get}
    var isRefreshingUser: Bool {get set}
    var userDetails: [UserDetail] {get}
    func logout()
}

struct UserDetail {
    var value: Any
    var fieldId: FieldId
}

final class SessionService: ObservableObject, SessionServiceProtocol {
    
    @Published var isConnectingServer: Bool = true
    
    @Published var sessionState: SessionState = .loggedOut
    
    @Published var isRefreshingUser: Bool = true

    @Published var userDetails: [UserDetail] = []

    private var handler: AuthStateDidChangeListenerHandle?
    private var userEmail: String?
    
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
                self.sessionState = user == nil ? .loggedOut : .loggedIn
                if let user = user {
                    self.userEmail = user.email
                    self.handleRefresh(with: user.uid)
                }
            })
        self.isConnectingServer = false
    }
    
    func handleRefresh(with uid: String) {
        isRefreshingUser = true
        print("Refresh user with: \(uid)")
        Database
            .database()
            .reference()
            .child("users")
            .child(uid)
            .observe(.value) { [weak self] snapshot in
                
                guard let self = self,
                      let value = snapshot.value as? NSDictionary,
                      let firstname = value[RegisterKeys.firstName.rawValue] as? String,
                      let lastname = value[RegisterKeys.lastName.rawValue] as? String,
                      let birthdayString = value[RegisterKeys.birthday.rawValue] as? String else {return}
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "YY/MM/dd"
                let birthday = dateFormatter.date(from: birthdayString)!
                
                self.userDetails = []
                self.userDetails.append(UserDetail(value: firstname, fieldId: .firstName))
                self.userDetails.append(UserDetail(value: lastname, fieldId: .lastName))
                self.userDetails.append(UserDetail(value: birthday, fieldId: .date))
                self.userDetails.append(UserDetail(value: self.userEmail!, fieldId: .email))
                print("End refresh user: \(self.userDetails)")
                self.isRefreshingUser = false
            }
    }
}

