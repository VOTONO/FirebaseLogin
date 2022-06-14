//
//  CommonValidations.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation

extension RegexValidationManager {
    
    static let simpleValidator: RegexValidationManager = {
        let validator = RegexValidationManager(
            [
                RegexFormItem(pattern: RegexPatterns.emptyString,
                              error: ValidationError.emptyField)
            ])
        return validator
    }()
    
    
    static let emailValidator: RegexValidationManager = {
        let validator = RegexValidationManager(
            [
                RegexFormItem(pattern: RegexPatterns.emptyString,
                              error: ValidationError.emptyField),
                RegexFormItem(pattern: RegexPatterns.email,
                              error: ValidationError.invalidEmail)
            ])
        return validator
    }()
    
    static let passwordValidator: RegexValidationManager = {
        let validator = RegexValidationManager(
            [
                RegexFormItem(pattern: RegexPatterns.emptyString,
                              error: ValidationError.emptyField),
                RegexFormItem(pattern: RegexPatterns.higherThanSix,
                              error: ValidationError.shortPassword)
            ])
        return validator
    }()
}
