//
//  LoginForm.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation

struct LoginForm {
    
    static func build() -> [FormComponent] {
        let form: [FormComponent] = [
            
            TextFormComponent.email,
            PasswordFormComponent.password,
            ButtonFormComponent.login]
        return form
    }
}
