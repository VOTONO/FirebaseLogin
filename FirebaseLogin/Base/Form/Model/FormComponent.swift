//
//  FormItem.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation
import SwiftUI
import Combine

protocol FormComponentProtocol {
    var id: UUID {get}
    var fieldId: FieldId {get}
    var validations: [ValidationManagerProtocol] {get}
    var value: Any {get}
}

class FormComponent: FormComponentProtocol, Identifiable {
    
    let id = UUID()
    let fieldId: FieldId
    var validations: [ValidationManagerProtocol]
    var value: Any
    
    init(_ id: FieldId, validations: [ValidationManagerProtocol] = [], value: Any) {
        self.fieldId = id
        self.validations = validations
        self.value = value
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

