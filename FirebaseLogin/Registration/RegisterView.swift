//
//  RegistrationView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var contentBuilder = FormContentBuilder()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                Text("Registration")
                    .font(.system(size: 26, weight: .bold))
                ForEach(contentBuilder.registerContent) { component in
                    switch component {
                    case is TextFormComponent:
                        InputTextField(component: component as! TextFormComponent)
                            .environmentObject(contentBuilder)
                    case is DateFormComponent:
                        DateFieldView(component: component as! DateFormComponent)
                            .environmentObject(contentBuilder)
                    case is PasswordFormComponent:
                        InputPasswordField(component: component as! PasswordFormComponent)
                            .environmentObject(contentBuilder)
                    case is ButtonFormComponent:
                        ButtonView(component: component as! ButtonFormComponent) { id in
                            switch id {
                            case .submit:
                                contentBuilder.validate()
                            default:
                                break
                            }
                        }
                            .environmentObject(contentBuilder)
                    default:
                        EmptyView()
                    }
                }
                
                HStack() {
                    Button(action: {
                        //TODO: Registration Screen
                    }, label: {
                        Text("Sign in")
                            .font(.system(size: 16, weight: .semibold))
                    })
                }
            }
            .padding(.horizontal, 10)
            .onChange(of: contentBuilder.formState,
                      perform: { state in
                switch state {
                case .valid(let user):
                    print(user)
                case .failed(let error):
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
        RegistrationView()
    }
}
