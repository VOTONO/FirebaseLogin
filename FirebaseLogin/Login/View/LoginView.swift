//
//  LoginView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    @StateObject private var formBuilder = LoginFormBuilder()
    
    @State var showRegister = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Login")
                .font(.system(size: 26, weight: .bold))
            ForEach(formBuilder.content) { component in
                switch component {
                case is TextFormComponent:
                    InputTextField<LoginFormBuilder>(component: component as! TextFormComponent)
                        .environmentObject(formBuilder)
                case is PasswordFormComponent:
                    InputPasswordField<LoginFormBuilder>(component: component as! PasswordFormComponent)
                        .environmentObject(formBuilder)
                case is ButtonFormComponent:
                    ButtonView<LoginFormBuilder>(component: component as! ButtonFormComponent) { id in
                        switch id {
                        case .submit:
                            formBuilder.validate()
                        default:
                            break
                        }
                    }
                default:
                    EmptyView()
                    
                }
            }
            HStack() {
                Button(action: {
                    showRegister.toggle()
                }, label: {
                    Text("Create Account")
                        .font(.system(size: 16, weight: .semibold))
                })
                .sheet(isPresented: $showRegister) {
                    RegisterView(viewModel: RegisterViewModel(registerService: RegisterService()),
                                 formBuilder: RegisterFormBuilder())
                }
                Spacer()
                Button(action: {
                    //TODO: Forgot password screen
                }, label: {
                    Text("Forgot Password?")
                        .font(.system(size: 16, weight: .semibold))
                })
            }
            .padding(.top, 5)
        }
        .padding(.horizontal, 10)
        .onChange(of: formBuilder.formState,
                  perform: { state in
            switch state {
            case .valid(let user):
                viewModel.userLogin = user
                viewModel.login()
            case .failed(let error):
                print(error.description)
            case .none:
                break
            }
        })
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel(service: LoginService()))
    }
}
