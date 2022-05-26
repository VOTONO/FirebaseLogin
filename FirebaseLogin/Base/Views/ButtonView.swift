//
//  LoginButtonView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct ButtonView: View {
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    internal init (title: String,
                   background: Color = .blue,
                   foreground: Color = .white,
                   border: Color = .clear,
                   handler: @escaping ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, minHeight: 50)
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 20, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Login") {}
            .preview(with: "Login Button")
        ButtonView(title: "Register") {}
            .preview(with: "Registration Button")
        ButtonView(title: "Cancel", background: .gray) {}
            .preview(with: "Cancel Button")
    }
}
