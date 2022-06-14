//
//  ProfileDateComponent.swift
//  FirebaseLogin
//
//  Created by Mac User on 08.06.2022.
//

import SwiftUI

final class ProfileDateComponent: FormComponent {
    let title: String
    
    init(id: FieldId,
         title: String,
         validations: [ValidationManagerProtocol] = []) {
        self.title = title
        super.init(id, validations: validations, value: Date())
    }
}
