//
//  InputPasswordFieldView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct PasswordFieldView: View {
    
    @Binding var password: String
    let placeholder: String
    let sfSymbol: String?
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        SecureField(placeholder, text: $password)
            .frame(maxWidth: .infinity,
                   minHeight: 50)
            .padding(.leading, sfSymbol == nil ? textFieldLeading/2 : textFieldLeading)
            .background(
                ZStack(alignment: .leading) {
                    if let sfSymbol = sfSymbol {
                        Image(systemName: sfSymbol)
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.leading, 8)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    RoundedRectangle(cornerRadius: 10,
                                     style: .continuous)
                    .stroke(Color.gray.opacity(0.25))
                }
            )
    }
}

struct InputPasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView(password: .constant(""),
                               placeholder: "Password", sfSymbol: "lock")
        .preview(with: "With symbol")
        PasswordFieldView(password: .constant(""),
                               placeholder: "Password", sfSymbol: nil)
        .preview(with: "Without symbol")
    }
}
