//
//  ProfileTextField.swift
//  FirebaseLogin
//
//  Created by Mac User on 26.05.2022.
//

import SwiftUI

struct ProfileTextField: View {
    
    @Binding var text: String
    let placehOlder: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        TextField(placehOlder, text: $text)
            .keyboardType(keyboardType)
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

struct ProfileTextField_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTextField(text: .constant(""),
                         placehOlder: "First Name",
                         keyboardType: .default)
            .preview(with: "First Name")
    }
}
