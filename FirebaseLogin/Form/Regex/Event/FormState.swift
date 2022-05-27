//
//  FormState.swift
//  FirebaseLogin
//
//  Created by Mac User on 27.05.2022.
//

import Foundation

struct User: Equatable {
    let firstName: String
    let lastName: String
    let password: String
    let email: String
    let birthday: Date
}

enum FormState {
    case valid(user: User)
    case failed(error: ValidationError)
}

extension FormState: Equatable {
    
    static func == (lhs: FormState, rhs: FormState) -> Bool {
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
