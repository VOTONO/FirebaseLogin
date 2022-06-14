//
//  LoginButtonView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let minHeight: CGFloat
    let cornerRadius: CGFloat
    let background: Color
    let foreground: Color
    let border: Color
    let handler: () -> ()
    
    
    init(title: String,
         minHeight: CGFloat = 40,
         cornerRadius: CGFloat = 5,
         backgroung: Color = .blue,
         foreground: Color = .white,
         border: Color = .blue,
         handler: @escaping () -> ()) {
        self.title = title
        self.minHeight = minHeight
        self.cornerRadius = cornerRadius
        self.background = backgroung
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }

    var body: some View {
        Button(title) {
            handler()
        }
        .frame(maxWidth: .infinity, minHeight: minHeight)
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 18, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
        
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Registration") {
        }
    }
}
