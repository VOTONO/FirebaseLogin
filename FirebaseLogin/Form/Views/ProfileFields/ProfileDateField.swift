//
//  ProfileDateField.swift
//  FirebaseLogin
//
//  Created by Mac User on 08.06.2022.
//

import SwiftUI

struct ProfileDateField<Builder: FormBuilderProtocol>: View {
    let component: ProfileDateComponent
    
    @EnvironmentObject var formBuilder: Builder
    @State private var date = Date()
    @State private var error: ValidationError?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            if error != nil {
                Text(error?.description ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.red)
            }
            DatePicker(component.title, selection: $date, in: ...Date(), displayedComponents: .date)
        }
        .onChange(of: date, perform: { _ in
            formBuilder.update(date, in: component)
            error = component
                .validations
                .compactMap { $0.validate(date) }
                .first
            print("Changed: \(date)")
            print(error)
        })
    }
}

struct ProfileDateField_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDateField<ProfileFormBuilder>(component: ProfileDateComponent(id: .date, title: "Birthday"))
            .preview(with: "Profile birthday")
    }
}
