//
//  ValidationManager.swift
//  FirebaseLogin
//
//  Created by Mac User on 27.05.2022.
//

import Foundation

protocol ValidationManagerProtocol {
    func validate(_ value: Any) -> ValidationError?
}

struct RegexValidationManager: ValidationManagerProtocol {
    
    private let items: [RegexFormItem]
    
    init(_ items: [RegexFormItem]) {
        self.items = items
    }
    
    func validate(_ value: Any) -> ValidationError? {
        
        let value = (value as? String) ?? ""
        
        for item in items {
            let regex = try? NSRegularExpression(pattern: item.pattern)
            let range = NSRange(location: 0, length: value.count)
            
            if regex?.firstMatch(in: value, range: range) == nil {
                return item.error
            }
        }
        return nil
    }
}

struct DateValidationManager: ValidationManagerProtocol {
    
    private let ageLimit: Int = 18
    
    func validate(_ value: Any) -> ValidationError? {
        
        guard let date = value as? Date else {
            return ValidationError.custom(message: "Invalid value passed")
        }
        
        if let calculatedAge = Calendar.current.dateComponents([.year], from: date, to: Date()).year,
           calculatedAge < ageLimit {
            return ValidationError.youngAge
        }
        return nil
    }
}
