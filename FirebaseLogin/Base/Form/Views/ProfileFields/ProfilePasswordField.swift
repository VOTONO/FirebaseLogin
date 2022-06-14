//
//  ProfilePasswordField.swift
//  FirebaseLogin
//
//  Created by Mac User on 07.06.2022.
//

import SwiftUI

struct ProfilePasswordField<Builder: FormBuilderProtocol>: View {
    
    let component: ProfilePasswordComponent
    @EnvironmentObject var formBuilder: Builder

    @State private var password = ""
    @State private var error: ValidationError?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if error != nil {
                Text(error?.description ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.red)
            }
            SecureField(component.placeholder, text: $password)
                .keyboardType(component.keyboardType)
        }
        .onChange(of: password, perform: { newValue in
            formBuilder.update(password, in: component)
            error = component
                .validations
                .compactMap { $0.validate(password) }
                .first
            print("Changed: \(password)")
            print(error)
        })
    }
}

struct ProfilePasswordField_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePasswordField<ProfileFormBuilder>(component:
                                                ProfilePasswordComponent(id: .password, placeholder: "Password"))
            .preview(with: "Profile password")
    }
}
