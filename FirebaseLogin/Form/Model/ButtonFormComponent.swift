//
//  ButtonFormComponent.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation
import SwiftUI

final class ButtonFormComponent: FormComponent {
    
    let title: String
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let background: Color
    let foreground: Color
    let border: Color
    
    init(id: FieldId,
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
