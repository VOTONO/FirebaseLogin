//
//  ProfileComponents.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import Foundation

extension TextFormComponent {
    
    static let profileEmail = TextFormComponent(id: .email,
                                                placeholder: "Email",
                                                keyboardType: .default,
                                                minHeight: 25,
                                                cornerRadius: 5,
                                                strokeColor: .black,
                                                sfSymbol: "envelope",
                                                validations: [RegexValidationManager.emailValidator])
    
    static let profileFirstName = TextFormComponent(id: .firstName,
                                                    placeholder: "First Name",
                                                    keyboardType: .default,
                                                    minHeight: 25,
                                                    cornerRadius: 5,
                                                    strokeColor: .black,
                                                    sfSymbol: nil,
                                                    validations: [RegexValidationManager.simpleValidator])
    
    static let profileLastName = TextFormComponent(id: .firstName,
                                                    placeholder: "Last Name",
                                                    keyboardType: .default,
                                                    minHeight: 25,
                                                    cornerRadius: 5,
                                                    strokeColor: .black,
                                                    sfSymbol: nil,
                                                    validations: [RegexValidationManager.simpleValidator])
}

extension PasswordFormComponent {
    
    static let profilePassword = PasswordFormComponent(id: .password,
                                                       placeholder: "Password",
                                                       minHeight: 25,
                                                       cornerRadius: 5,
                                                       strokeColor: .black,
                                                       sfSymbol: "lock",
                                                       validations: [RegexValidationManager.passwordValidator])
}

extension DateFormComponent {
    
    static let profileBirthday = DateFormComponent(id: .date,
                                                   title: "Birthday",
                                                   minHeight: 25,
                                                   cornerRadius: 5,
                                                   strokeColor: .black,
                                                   validations: [DateValidationManager()])
    
}
