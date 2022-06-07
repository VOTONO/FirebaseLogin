//
//  RegisterForm.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation

struct RegisterForm {
    
    static func build() -> [FormComponent] {
        let form: [FormComponent] = [
            TextFormComponent.email,
            PasswordFormComponent.password,
            TextFormComponent.firstName,
            TextFormComponent.lastname,
            DateFormComponent.birthday]
            //ButtonFormComponent.register]
        return form
    }

}
