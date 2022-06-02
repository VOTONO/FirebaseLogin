//
//  LoginButtonView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct ButtonView<Builder: FormBuilderProtocol>: View {
    
    typealias ActionHandler = (_ formId: FieldId) -> Void
    
    let component: ButtonFormComponent
    let handler: ActionHandler
    
    @EnvironmentObject var formBuilder: Builder
    
    init(component: ButtonFormComponent,
         handler: @escaping ButtonView.ActionHandler) {
        self.component = component
        self.handler = handler
    }

    var body: some View {
        Button(component.title) {
            handler(component.fieldId)
        }
        .frame(maxWidth: .infinity, minHeight: component.minHeight)
        .background(component.background)
        .foregroundColor(component.foreground)
        .font(.system(size: 18, weight: .bold))
        .cornerRadius(component.cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: component.cornerRadius)
                .stroke(component.border, lineWidth: 2)
        )
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView<RegisterFormBuilder>(component: ButtonFormComponent(id: .submit,
                                                  title: "Register")) { _ in }
            .environmentObject(RegisterFormBuilder())
            .preview(with: "Register")
    }
}
