//
//  InputTextFieldView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct InputTextField: View {
    
    let component: TextFormComponent
    
    @EnvironmentObject var contentBuilder: FormContentBuilder
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
                        RoundedRectangle(cornerRadius: 10,
                                         style: .continuous)
                        .stroke(error == nil ? component.strokeColor : Color.red)
                    })
        }
        .onSubmit({
            contentBuilder.update(text, in: component)
            error = component
                .validations
                .compactMap { $0.validate(text) }
                .first
        })
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField( component: TextFormComponent(id: .email,
                                                     placeholder: "Email",
                                                     keyboardType: .emailAddress, minHeight: 40,
                                                     cornerRadius: 15,
                                                     strokeColor: .gray.opacity(0.5),
                                                     sfSymbol: "envelope"))
        .environmentObject(FormContentBuilder())
        .preview(with: "With symbol")
        
    }
}
