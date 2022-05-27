//
//  ProfileView.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    ProfileTextField(text: $firstName,
                                     placehOlder: "First Name",
                                     keyboardType: .default)
                    ProfileTextField(text: $lastName,
                                     placehOlder: "Last Name",
                                     keyboardType: .default)
                }
                Section(header: Text("Account Information")) {
                    ProfileTextField(text: $email,
                                     placehOlder: "Email",
                                     keyboardType: .emailAddress)
                    ProfilePasswordField(password: $password,
                                         placehOlder: "Password")
                }
                
            }
        }
        .navigationTitle("Profile")
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
