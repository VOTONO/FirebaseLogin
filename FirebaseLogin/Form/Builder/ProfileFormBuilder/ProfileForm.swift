//
//  ProfileForm.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import Foundation

struct ProfileForm {
    
    static func build() -> [FormComponent] {
        let form: [FormComponent] = [

            ProfileTextComponent.email,
            ProfilePasswordComponent.password,
            ProfileTextComponent.firstName,
            ProfileTextComponent.lastname,
            ProfileDateComponent.birthday]
        
        return form
    }
}
