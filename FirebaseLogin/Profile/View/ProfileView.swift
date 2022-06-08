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
        NavigationView {
            Form {
                Section(header: Text("Account Information")) {
                    ForEach(formBuilder.accountInfo) { component in
                        switch component {
                        case is ProfileTextComponent:
                            ProfileTextField<ProfileFormBuilder>(component: component as! ProfileTextComponent)
                                .environmentObject(formBuilder)
                        case is ProfilePasswordComponent:
                            ProfilePasswordField<ProfileFormBuilder>(component: component as! ProfilePasswordComponent)
                                .environmentObject(formBuilder)
                        default:
                            EmptyView()
                        }
                    }
                }
                Section(header: Text("User Information")) {
                    ForEach(formBuilder.userInfo) { component in
                        switch component {
                        case is ProfileTextComponent:
                            ProfileTextField<ProfileFormBuilder>(component: component as! ProfileTextComponent)
                                .environmentObject(formBuilder)
                        case is ProfileDateComponent:
                            ProfileDateField<ProfileFormBuilder>(component: component as! ProfileDateComponent)
                                .environmentObject(formBuilder)
                        default:
                            EmptyView()
                        }
                    }
                }
                Section {
                    HStack {
                        Spacer()
                        Button(action: {
                            service.logout()
                        }, label: {
                            Text("Log out")
                                .font(.system(size: 16, weight: .semibold))
                        })
                        .foregroundColor(.red)
                        Spacer()
                    }
                }
            }
            .onAppear(perform: {
                    UITableView.appearance().contentInset.top = -50
                })
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
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
