//
//  TextFormComponent.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation
import SwiftUI

final class InputTextComponent: FormComponent {
    let placeholder: String
    let keyboardType: UIKeyboardType
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let strokeColor: Color
    let sfSymbol: String?
    
    init(id: FieldId,
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
        super.init(id, validations: validations, value: "")
    }
}
