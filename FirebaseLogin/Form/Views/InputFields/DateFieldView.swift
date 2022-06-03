//
//  DateFieldView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct DateFieldView<Builder: FormBuilderProtocol>: View {
    
    let component: DateFormComponent
    
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
                .frame(maxWidth: .infinity, minHeight: component.minHeight)
                .padding(.leading, 15)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: component.cornerRadius, style: .continuous)
                            .stroke(error == nil ? component.strokeColor : Color.red)
                    })
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

struct DateFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DateFieldView<RegisterFormBuilder>(component: DateFormComponent(id: .date,
                                                   title: "Birthday"))
            .environmentObject(RegisterFormBuilder())
            .preview(with: "Birthdate")
    }
}
