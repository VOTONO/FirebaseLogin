//
//  InputTextFieldView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct InputTextField<Builder: FormBuilderProtocol>: View {
    
    let component: TextFormComponent
    @EnvironmentObject var formBuilder: Builder

    @State private var text = ""
    @State private var error: ValidationError?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if error != nil {
                Text(error?.description ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.red)
            }
            TextField(component.placeholder, text: $text)
                .frame(maxWidth: .infinity,
                       minHeight: component.minHeight)
                .padding(.leading, component.sfSymbol == nil ? textFieldLeading/2 : textFieldLeading)
                .keyboardType(component.keyboardType)
                .background(
                    ZStack(alignment: .leading) {
                        if let sfSymbol = component.sfSymbol {
                            Image(systemName: sfSymbol)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 5)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        RoundedRectangle(cornerRadius: component.cornerRadius,
                                         style: .continuous)
                        .stroke(error == nil ? component.strokeColor : Color.red)
                    })
        }
        .onSubmit({
            formBuilder.update(text, in: component)
            error = component
                .validations
                .compactMap { $0.validate(text) }
                .first
            print("Changed: \(text)")
            print(error)
        })
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField<RegisterFormBuilder>( component: TextFormComponent.firstName)
        .environmentObject(RegisterFormBuilder())
        .preview(with: "Register")
        ProfileTextField<ProfileFormBuilder>(component: ProfileTextComponent.firstName)
            .environmentObject(RegisterFormBuilder())
            .preview(with: "Profile")
    }
}
