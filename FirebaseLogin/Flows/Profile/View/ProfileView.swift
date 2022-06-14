//
//  ProfileView.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("User Information")) {
                    ForEach(viewModel.formBuilder.userInfo) { component in
                        switch component {
                        case is ProfileTextComponent:
                            ProfileTextField<ProfileFormBuilder>(component: component as! ProfileTextComponent)
                                .environmentObject(viewModel.formBuilder)
                        case is ProfileDateComponent:
                            ProfileDateField<ProfileFormBuilder>(component: component as! ProfileDateComponent)
                                .environmentObject(viewModel.formBuilder)
                        default:
                            EmptyView()
                        }
                    }
                }
                Section(header: Text("Contacts")) {
                    ForEach(viewModel.formBuilder.accountInfo) { component in
                        switch component {
                        case is ProfileTextComponent:
                            ProfileTextField<ProfileFormBuilder>(component: component as! ProfileTextComponent)
                                .environmentObject(viewModel.formBuilder)
                        case is ProfilePasswordComponent:
                            ProfilePasswordField<ProfileFormBuilder>(component: component as! ProfilePasswordComponent)
                                .environmentObject(viewModel.formBuilder)
                        default:
                            EmptyView()
                        }
                    }
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.sessionService.logout()
                        }, label: {
                            Text("Save Changes")
                        })
                        .foregroundColor(viewModel.formBuilder.isUpdated == true ? .blue : .gray)
                        .disabled(!viewModel.formBuilder.isUpdated)
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            viewModel.sessionService.logout()
                        }, label: {
                            Text("Log out")
                        })
                        .foregroundColor(.red)
                        Spacer()

                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .onAppear(perform: {
                    UITableView.appearance().contentInset.top = -50
                })
        }
        .navigationTitle(Text("Profile"))
        .onReceive(NotificationCenter.default.publisher(
            for: UIApplication.willEnterForegroundNotification
        )) { _ in
            viewModel.updateUser()
        }
        .onChange(of: viewModel.formBuilder.formState,
              perform: { state in
                switch state {
                case .valid(let user):
                    print("Valide profile form wit user: \(user)")
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
        ProfileView(viewModel: ProfileViewModel(sessionService: SessionService(), formBuilder: ProfileFormBuilder()))
    }
}
