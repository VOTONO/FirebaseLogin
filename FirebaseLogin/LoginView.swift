//
//  LoginView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Login")
                .font(.system(size: 26, weight: .bold))
            TextFieldView(text: .constant(""),
                          placeholder: "Email",
                          keboardType: .emailAddress,
                          sfSymbol: "envelope")
            PasswordFieldView(password: .constant(""),
                              placeholder: "Password",
                              sfSymbol: "lock")
            HStack() {
                Button(action: {
                    //TODO: Forget Password Screen
                }, label: {
                    Text("Create Account")
                        .font(.system(size: 16, weight: .semibold))
                })
                Spacer()
                Button(action: {
                    //TODO: Registration Screen
                }, label: {
                    Text("Forget Password")
                        .font(.system(size: 16, weight: .semibold))
                })
            }
            //.padding(.vertical, 15)
            .padding(.top, 20)
            ButtonView(title: "Log in", handler: {})
        }
        .padding(.horizontal, 10)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
