//
//  ProfileView.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @StateObject var formBuilder: ProfileFormBuilder
    @StateObject var service: SessionService
    
    var body: some View {
        Form {
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
                default:
                    EmptyView()
                }
            }
        }
        .onChange(of: formBuilder.formState,
              perform: { state in
                switch state {
                case .valid(let user):
                    viewModel.userDetails = user
                case .failed(let error):
                    print("Invalide form")
                    print(error.description)
                case .none:
                    break
                }
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(), formBuilder: ProfileFormBuilder(), service: SessionService())
    }
}
