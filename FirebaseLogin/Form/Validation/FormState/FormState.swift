//
//  FormState.swift
//  FirebaseLogin
//
//  Created by Mac User on 27.05.2022.
//

import Foundation

protocol User: Equatable {
    var email: String { get }
    var password: String { get }
}

enum RegisterFormState {
    case valid(user: UserDetails)
    case failed(error: ValidationError)
}

extension RegisterFormState: Equatable {
    
    static func == (lhs: RegisterFormState, rhs: RegisterFormState) -> Bool {
        switch (lhs, rhs) {
        case (.valid(user: let lhsType),
              .valid(user: let rhsType)):
            return lhsType == rhsType
        case (.failed(error: let lhsType),
              .failed(error: let rhsType)):
        return lhsType.description == rhsType.description
        default:
            return false
        }
    }
}

enum LoginFormState {
    case valid(user: UserLogin)
    case failed(error: ValidationError)
}

extension LoginFormState: Equatable {
    
    static func == (lhs: LoginFormState, rhs: LoginFormState) -> Bool {
        switch (lhs, rhs) {
        case (.valid(user: let lhsType),
              .valid(user: let rhsType)):
            return lhsType == rhsType
        case (.failed(error: let lhsType),
              .failed(error: let rhsType)):
        return lhsType.description == rhsType.description
        default:
            return false
        }
    }
}

enum ProfileFormState: Equatable {
    case valid(user: UserDetails)
    case failed(error: ValidationError)
}

extension ProfileFormState {
    
    static func == (lhs: ProfileFormState, rhs: ProfileFormState) -> Bool {
        switch (lhs, rhs) {
        case (.valid(user: let lhsType),
              .valid(user: let rhsType)):
            return lhsType == rhsType
        case (.failed(error: let lhsType),
              .failed(error: let rhsType)):
        return lhsType.description == rhsType.description
        default:
            return false
        }
    }
}
