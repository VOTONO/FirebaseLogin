//
//  FormContentBuilder.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import Foundation
import Combine
import SwiftUI

protocol FormBuilderProtocol: ObservableObject {
    var content: [FormComponent] {get}
    func update(_ value: Any, in component: FormComponentProtocol)
    func validate()
}
