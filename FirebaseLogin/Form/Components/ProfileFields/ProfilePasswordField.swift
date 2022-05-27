//
//  ProfilePasswordField.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct ProfilePasswordField: View {
    
    @Binding var password: String
    let placehOlder: String

    
    var body: some View {
        SecureField(placehOlder, text: $password)
            .frame(maxWidth: .infinity,
                   minHeight: 30)
            .padding(.leading, 5)
            .background(
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5,
                                     style: .continuous)
                    .stroke(Color.gray)
                }
            )
    }
}

struct ProfilePasswordField_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePasswordField(password: .constant(""),
                             placehOlder: "Password")
        .preview(with: "Password")
    }
        
}
