//
//  LoginViewModel.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var userLogin: UserLogin = UserLogin(email: "", password: "")
    
}
