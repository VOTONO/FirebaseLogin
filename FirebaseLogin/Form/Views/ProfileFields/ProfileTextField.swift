//
//  ProfileTextField.swift
//  FirebaseLogin
//
//  Created by Mac User on 07.06.2022.
//

import SwiftUI

struct ProfileTextField<Builder: FormBuilderProtocol>: View {
    
    let component: ProfileTextComponent
    @EnvironmentObject var formBuilder: Builder

    @State private var text = ""
    @State private var error: ValidationError?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if error != nil {
                Text(error?.description ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.red)
            }
            TextField(component.placeholder, text: $text)
                .keyboardType(component.keyboardType)
        }
        .onChange(of: text, perform: { newValue in
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

struct ProfileTextField_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTextField<ProfileFormBuilder>(component: ProfileTextComponent(id: .email, placeholder: "Email", keyboardType: .emailAddress))
            .preview(with: "Profile Email")
    }
}
