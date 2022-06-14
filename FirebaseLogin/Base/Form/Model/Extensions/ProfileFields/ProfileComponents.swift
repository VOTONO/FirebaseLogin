//
//  ProfileComponents.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import Foundation

extension ProfileTextComponent {
    
    static let email = ProfileTextComponent(id: .email,
                                         placeholder: "Email",
                                         keyboardType: .emailAddress,
                                         validations: [RegexValidationManager.emailValidator])
    
    static let firstName = ProfileTextComponent(id: .firstName,
                                             placeholder: "First Name",
                                             keyboardType: .default,
                                             validations: [RegexValidationManager.simpleValidator])
    
    static let lastname = ProfileTextComponent(id: .lastName,
                                            placeholder: "Last Name",
                                            keyboardType: .default,
                                            validations: [RegexValidationManager.simpleValidator])
}

extension ProfilePasswordComponent {
    
    static let password = ProfilePasswordComponent(id: .password,
                                                placeholder: "Password",
                                                validations: [RegexValidationManager.passwordValidator])
}

extension ProfileDateComponent {
    
    static let birthday = ProfileDateComponent(id: .date,
                                            title: "Birthday",
                                            validations: [DateValidationManager()])
    
}
