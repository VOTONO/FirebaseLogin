//
//  InputPasswordFieldView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct InputPasswordField<Builder: FormBuilderProtocol>: View {
    
    //@Binding var password: String
    let component: PasswordFormComponent
    
    @EnvironmentObject var formBuilder: Builder
    @State private var password = ""
    @State private var error: ValidationError?
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if error != nil {
                Text(error?.description ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.red)
            }
            SecureField(component.placeholder, text: $password)
                .frame(maxWidth: .infinity,
                       minHeight: component.minHeight)
                .padding(.leading, component.sfSymbol == nil ? textFieldLeading/2 : textFieldLeading)
                .background(
                    ZStack(alignment: .leading) {
                        if let sfSymbol = component.sfSymbol {
                            Image(systemName: sfSymbol)
                                .font(.system(size: 16, weight: .semibold))
                                .padding(.leading, 8)
                                .foregroundColor(Color.gray.opacity(0.5))
                        }
                        RoundedRectangle(cornerRadius: component.cornerRadius,
                                         style: .continuous)
                        .stroke(error == nil ? component.strokeColor : Color.red)
                    })
        }
        .onSubmit({
            formBuilder.update(password, in: component)
            error = component
                .validations
                .compactMap { $0.validate(password) }
                .first
        })
    }
}

struct InputPasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputPasswordField<RegisterFormBuilder>(component: PasswordFormComponent(id: .password,
                                                            placeholder: "Password",
                                                            keyboardType: .default,
                                                            minHeight: 40,
                                                            cornerRadius: 10,
                                                            strokeColor: .gray.opacity(0.25),
                                                            sfSymbol: "lock"))
        .environmentObject(RegisterFormBuilder())
        .preview(with: "With symbol")
    }
}
