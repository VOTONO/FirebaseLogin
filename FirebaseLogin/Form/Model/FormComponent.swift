//
//  FormItem.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation
import SwiftUI

protocol FormComponentProtocol {
    var id: UUID {get}
    var fieldId: FieldId {get}
    var validations: [ValidationManagerProtocol] {get}
    var value: Any? {get}
}

class FormComponent: FormComponentProtocol, Identifiable {
    
    let id = UUID()
    let fieldId: FieldId
    var validations: [ValidationManagerProtocol]
    var value: Any?
    
    init(_ id: FieldId, validations: [ValidationManagerProtocol] = []) {
        self.fieldId = id
        self.validations = validations
    }
}

enum FieldId {
    case firstName
    case lastName
    case email
    case password
    case date
    case submit
}

