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
            
            InputTextComponent.email,
            InputPasswordComponent.password]
        return form
    }
}
