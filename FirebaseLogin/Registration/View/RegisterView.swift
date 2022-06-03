//
//  RegistrationView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct RegisterView: View {
    
    
    @ObservedObject var viewModel: RegisterViewModel
    @StateObject  var formBuilder: RegisterFormBuilder
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Registration")
                    .font(.system(size: 26, weight: .bold))
                ForEach(formBuilder.content) { component in
                    switch component {
                    case is TextFormComponent:
                        InputTextField<RegisterFormBuilder>(component: component as! TextFormComponent)
                            .environmentObject(formBuilder)
                    case is DateFormComponent:
                        DateFieldView<RegisterFormBuilder>(component: component as! DateFormComponent)
                            .environmentObject(formBuilder)
                    case is PasswordFormComponent:
                        InputPasswordField<RegisterFormBuilder>(component: component as! PasswordFormComponent)
                            .environmentObject(formBuilder)
                    case is ButtonFormComponent:
                        ButtonView<RegisterFormBuilder>(component: component as! ButtonFormComponent) { id in
                            print("Tap register! form status: \(String(describing: formBuilder.formState))")
                            switch id {
                            case .submit:
                                formBuilder.validate()
                            default:
                                break
                            }
                        }
                            .environmentObject(formBuilder)
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(.horizontal, 10)
        .onChange(of: formBuilder.formState,
                  perform: { state in
            switch state {
            case .valid(let user):
                viewModel.userDetails = user
                viewModel.register()
            case .failed(let error):
                print("Invalide form")
                print(error.description)
            case .none:
                break
            }
        })
        }
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewModel: RegisterViewModel(registerService: RegisterService()), formBuilder: RegisterFormBuilder())
    }
}
