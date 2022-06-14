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

            ProfileTextComponent.firstName,
            ProfileTextComponent.lastname,
            ProfileDateComponent.birthday,
            ProfileTextComponent.email]
        
        return form
    }
}
