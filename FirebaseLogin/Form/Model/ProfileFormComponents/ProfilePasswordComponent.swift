//
//  ProfilePasswordComponent.swift
//  FirebaseLogin
//
//  Created by Mac User on 07.06.2022.
//

import Foundation
import SwiftUI

final class ProfilePasswordComponent: FormComponent {
    
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(id: FieldId,
         placeholder: String,
         keyboardType: UIKeyboardType = .default,
         validations: [ValidationManagerProtocol] = []) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id, validations: validations)
    }
}
