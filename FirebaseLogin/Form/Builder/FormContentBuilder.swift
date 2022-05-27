//
//  FormContentBuilder.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation
import Combine
import SwiftUI

protocol FormContentBuilderProtocol {
    var registerContent: [FormComponent] {get}
    var formState: FormState? {get}
    func update(_ value: Any, in component: FormComponentProtocol)
    func validate()
}

final class FormContentBuilder: ObservableObject, FormContentBuilderProtocol {
    
    @Published private(set) var formState: FormState?

    
//MARK: - Registration Form
    private(set) lazy var registerContent: [FormComponent] = [
        TextFormComponent(id: .email,
                          placeholder: "Email Name",
                          keyboardType: .emailAddress,
                          sfSymbol: "envelope",
                          validations: [
                            
                            RegexValidationManager(
                                [
                                    RegexFormItem(pattern: RegexPatterns.emptyString,
                                                  error: ValidationError.emptyField),
                                    RegexFormItem(pattern: RegexPatterns.email,
                                                  error: ValidationError.invalidEmail)
                                ])
                          ]),
        PasswordFormComponent(id: .password,
                              placeholder: "Password",
                              sfSymbol: "lock",
                              validations: [
                                
                                RegexValidationManager(
                                    [
                                        RegexFormItem(pattern: RegexPatterns.emptyString,
                                                      error: ValidationError.emptyField),
                                        RegexFormItem(pattern: RegexPatterns.higherThanSix,
                                                      error: ValidationError.shortPassword)
                                    ])
                              ]),
        TextFormComponent(id: .firstName,
                          placeholder: "First Name",
                          keyboardType: .default,
                          sfSymbol: nil,
                          validations: [
                            
                            RegexValidationManager(
                                [
                                    RegexFormItem(pattern: RegexPatterns.emptyString,
                                                  error: ValidationError.emptyField)
                                ])
                          ]),
        TextFormComponent(id: .lastName,
                          placeholder: "Last Name",
                          keyboardType: .default,
                          sfSymbol: nil,
                          validations: [
                            
                            RegexValidationManager(
                                [
                                    RegexFormItem(pattern: RegexPatterns.emptyString,
                                                  error: ValidationError.emptyField)
                                ])
                          ]),
        DateFormComponent(id: .date,
                          title: "Birthday",
                          validations: [DateValidationManager()]),
        ButtonFormComponent(id: .submit,
                            title: "Register")]
    
//MARK: - Login Form
    
    private(set) lazy var loginContent: [FormComponent] = [
        
        TextFormComponent(id: .email,
                          placeholder: "Email Name",
                          keyboardType: .emailAddress,
                          sfSymbol: "envelope",
                          validations: [
                            
                            RegexValidationManager(
                                [
                                    RegexFormItem(pattern: RegexPatterns.emptyString,
                                                  error: ValidationError.emptyField),
                                    RegexFormItem(pattern: RegexPatterns.email,
                                                  error: ValidationError.invalidEmail)
                                ])
                          ]),
        PasswordFormComponent(id: .password,
                              placeholder: "Password",
                              sfSymbol: "lock",
                              validations: [
                                
                                RegexValidationManager(
                                    [
                                        RegexFormItem(pattern: RegexPatterns.emptyString,
                                                      error: ValidationError.emptyField),
                                        RegexFormItem(pattern: RegexPatterns.higherThanSix,
                                                      error: ValidationError.shortPassword)
                                    ])
                              ])]
        
        
//MARK: - Functions
    
    func update(_ value: Any, in component: FormComponentProtocol) {
        guard let index = registerContent.firstIndex(where: { $0.id == component.id }) else {return}
        registerContent[index].value = value
    }
    
    func validate() {
        
        let formComponents = registerContent
            .filter {$0.formId != .submit}
        
        for component in formComponents {
            for validator in component.validations {
                if let error = validator.validate(component.value as Any) {
                    self.formState = .failed(error: error)
                    return
                }
            }
        }
        if let firstName = formComponents.first(where: { $0.formId == .firstName })?.value as? String,
           let lastName = formComponents.first(where: { $0.formId == .lastName })?.value as? String,
           let email = formComponents.first(where: { $0.formId == .email })?.value as? String,
           let password = formComponents.first(where: { $0.formId == .password })?.value as? String,
           let birthday = formComponents.first(where: { $0.formId == .date })?.value as? Date {
            
            let newUser = User(firstName: firstName,
                               lastName: lastName,
                               password: password,
                               email: email,
                               birthday: birthday)
            self.formState = .valid(user: newUser)
        }
    }
}
