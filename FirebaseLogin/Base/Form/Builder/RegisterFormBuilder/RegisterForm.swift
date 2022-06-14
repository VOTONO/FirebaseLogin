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
            InputTextComponent.email,
            InputPasswordComponent.password,
            InputTextComponent.firstName,
            InputTextComponent.lastname,
            InputDateComponent.birthday]
            //ButtonFormComponent.register]
        return form
    }

}
