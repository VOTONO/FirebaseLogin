//
//  ValidationError.swift
//  FirebaseLogin
//
//  Created by Mac User on 27.05.2022.
//

import Foundation

enum ValidationError: Error {
    case custom(message: String)
    case invalidEmail
    case shortPassword
    case emptyField
    case youngAge
}

extension ValidationError {
    
    var description: String {
        switch self {
        case .custom(let message):
            return message
        case .invalidEmail:
            return "Invalide email"
        case .shortPassword:
            return "Password must be longer than 6"
        case .emptyField:
            return "This field can't be empty"
        case .youngAge:
            return "You must be older than 18"
        }
    }
}
