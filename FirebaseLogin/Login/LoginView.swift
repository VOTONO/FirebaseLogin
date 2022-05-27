//
//  LoginView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject private var contentBuilder = FormContentBuilder()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Login")
                .font(.system(size: 26, weight: .bold))
            HStack() {
                Button(action: {
                    //TODO: Registration Screen
                }, label: {
                    Text("Create Account")
                        .font(.system(size: 16, weight: .semibold))
                })
                Spacer()
                Button(action: {
                    //TODO: Registration Screen
                }, label: {
                    Text("Forget Password?")
                        .font(.system(size: 16, weight: .semibold))
                })
            }
            .padding(.top, 5)
        }
        .padding(.horizontal, 10)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
