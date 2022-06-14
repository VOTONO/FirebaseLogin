//
//  DateFormComponent.swift
//  FirebaseLogin
//
//  Created by Mac User on 01.06.2022.
//

import Foundation
import SwiftUI

final class DateFormComponent: FormComponent {
    let title: String
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let strokeColor: Color
    
    init(id: FieldId,
         title: String,
         minHeight: CGFloat = 35,
         cornerRadius: CGFloat = 10,
         strokeColor: Color = .gray.opacity(0.25),
         validations: [ValidationManagerProtocol] = []) {
        self.title = title
        self.minHeight = minHeight
        self.cornerRadius = cornerRadius
        self.strokeColor = strokeColor
        super.init(id, validations: validations, value: "")
    }
}
