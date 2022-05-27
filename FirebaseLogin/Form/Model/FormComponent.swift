//
//  FormItem.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation
import SwiftUI
//import UIKit

protocol FormComponentProtocol {
    var id: UUID {get}
    var formId: FormField {get}
    var validations: [ValidationManagerProtocol] {get}
    var value: Any? {get}
}

enum FormField {
    case firstName
    case lastName
    case email
    case password
    case date
    case submit
}

class FormComponent: FormComponentProtocol, Identifiable {
    
    let id = UUID()
    let formId: FormField
    var validations: [ValidationManagerProtocol]
    var value: Any?
    
    init(_ id: FormField, validations: [ValidationManagerProtocol] = []) {
        self.formId = id
        self.validations = validations
    }
}

final class TextFormComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let strokeColor: Color
    let sfSymbol: String?
    
    init(id: FormField,
         placeholder: String,
         keyboardType: UIKeyboardType,
         minHeight: CGFloat = 40,
         cornerRadius: CGFloat = 10,
         strokeColor: Color = .gray.opacity(0.25),
         sfSymbol: String?,
         validations: [ValidationManagerProtocol] = []) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.minHeight = minHeight
        self.cornerRadius = cornerRadius
        self.strokeColor = strokeColor
        self.sfSymbol = sfSymbol
        super.init(id, validations: validations)
    }
}

final class PasswordFormComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let strokeColor: Color
    let sfSymbol: String?
    
    init(id: FormField,
         placeholder: String,
         keyboardType: UIKeyboardType = .default,
         minHeight: CGFloat = 40,
         cornerRadius: CGFloat = 10,
         strokeColor: Color = .gray.opacity(0.25),
         sfSymbol: String?,
         validations: [ValidationManagerProtocol] = []) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.minHeight = minHeight
        self.cornerRadius = cornerRadius
        self.strokeColor = strokeColor
        self.sfSymbol = sfSymbol
        super.init(id, validations: validations)
    }
}

final class DateFormComponent: FormComponent {
    let title: String
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let strokeColor: Color
    
    init(id: FormField,
         title: String,
         minHeight: CGFloat = 40,
         cornerRadius: CGFloat = 10,
         strokeColor: Color = .gray.opacity(0.25),
         validations: [ValidationManagerProtocol] = []) {
        self.title = title
        self.minHeight = minHeight
        self.cornerRadius = cornerRadius
        self.strokeColor = strokeColor
        super.init(id, validations: validations)
    }
}

final class ButtonFormComponent: FormComponent {
    
    let title: String
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let background: Color
    let foreground: Color
    let border: Color
    
    init(id: FormField,
         title: String,
         minHeight: CGFloat = 45,
         cornerRadius: CGFloat = 10,
         background: Color = .blue,
         foreground: Color = .white,
         border: Color = .blue,
         validations: [ValidationManagerProtocol] = []) {
        self.title = title
        self.minHeight = minHeight
        self.cornerRadius = cornerRadius
        self.background = background
        self.foreground = foreground
        self.border = border
        super.init(id, validations: validations)
    }
}

        


