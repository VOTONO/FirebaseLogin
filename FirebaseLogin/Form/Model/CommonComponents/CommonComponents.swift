//
//  RegisterComponents.swift
//  FirebaseLogin
//
//  Created by Mac User on 02.06.2022.
//

import Foundation

extension TextFormComponent {
    
    static let email = TextFormComponent(id: .email,
                                         placeholder: "Email",
                                         keyboardType: .emailAddress,
                                         sfSymbol: "envelope",
                                         validations: [RegexValidationManager.emailValidator])
    
    static let firstName = TextFormComponent(id: .firstName,
                                             placeholder: "First Name",
                                             keyboardType: .default,
                                             sfSymbol: nil,
                                             validations: [RegexValidationManager.simpleValidator])
    
    static let lastname = TextFormComponent(id: .firstName,
                                            placeholder: "Last Name",
                                            keyboardType: .default,
                                            sfSymbol: nil,
                                            validations: [RegexValidationManager.simpleValidator])
    
}

extension PasswordFormComponent {
    
    static let password = PasswordFormComponent(id: .password,
                                                placeholder: "Password",
                                                sfSymbol: "lock",
                                                validations: [RegexValidationManager.passwordValidator])
}

extension DateFormComponent {
    
    static let birthday = DateFormComponent(id: .date,
                                            title: "Birthday",
                                            validations: [DateValidationManager()])
    
}

extension ButtonFormComponent {
    
    static let register = ButtonFormComponent(id: .submit,
                                              title: "Register")
    
    static let login = ButtonFormComponent(id: .submit,
                                              title: "Login")
    
}
