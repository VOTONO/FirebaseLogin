//
//  LoginButtonView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = (_ formId: FormField) -> Void
    
    let component: ButtonFormComponent
    let handler: ActionHandler
    
    @EnvironmentObject var contentBuilder: FormContentBuilder
    
    init(component: ButtonFormComponent,
         handler: @escaping ButtonView.ActionHandler) {
        self.component = component
        self.handler = handler
    }

    var body: some View {
        Button(component.title) {
            handler(component.formId)
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
        ButtonView(component: ButtonFormComponent(id: .submit,
                                                  title: "Register")) { _ in }
            .environmentObject(FormContentBuilder())
            .preview(with: "Register")
    }
}
