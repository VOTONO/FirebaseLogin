//
//  RegisterComponents.swift
//  FirebaseLogin
//
//  Created by Mac User on 02.06.2022.
//

import Foundation

extension InputTextComponent {
    
    static let email = InputTextComponent(id: .email,
                                         placeholder: "Email",
                                         keyboardType: .emailAddress,
                                         sfSymbol: "envelope",
                                         validations: [RegexValidationManager.emailValidator])
    
    static let firstName = InputTextComponent(id: .firstName,
                                             placeholder: "First Name",
                                             keyboardType: .default,
                                             sfSymbol: nil,
                                             validations: [RegexValidationManager.simpleValidator])
    
    static let lastname = InputTextComponent(id: .lastName,
                                            placeholder: "Last Name",
                                            keyboardType: .default,
                                            sfSymbol: nil,
                                            validations: [RegexValidationManager.simpleValidator])
    
}

extension InputPasswordComponent {
    
    static let password = InputPasswordComponent(id: .password,
                                                placeholder: "Password",
                                                sfSymbol: "lock",
                                                validations: [RegexValidationManager.passwordValidator])
}

extension InputDateComponent {
    
    static let birthday = InputDateComponent(id: .date,
                                            title: "Birthday",
                                            validations: [DateValidationManager()])
    
}
