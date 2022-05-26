//
//  InputTextFieldView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    let keboardType: UIKeyboardType
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity,
                   minHeight: 50)
            .padding(.leading, sfSymbol == nil ? textFieldLeading/2 : textFieldLeading)
            .keyboardType(keboardType)
            .background(
                ZStack(alignment: .leading) {
                    if let sfSymbol = sfSymbol {
                        Image(systemName: sfSymbol)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 5)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    RoundedRectangle(cornerRadius: 10,
                                     style: .continuous)
                    .stroke(Color.gray.opacity(0.25))
                }
            )
    }
}

struct InputTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""),
                           placeholder: "Email",
                           keboardType: .emailAddress, sfSymbol: "envelope")
        .preview(with: "With symbol")
        TextFieldView(text: .constant(""),
                           placeholder: "Email",
                           keboardType: .emailAddress, sfSymbol: nil)
        .preview(with: "Without symbol")
    }
}
