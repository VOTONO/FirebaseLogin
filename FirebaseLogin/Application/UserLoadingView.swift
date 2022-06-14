//
//  UserLoadingView.swift
//  FirebaseLogin
//
//  Created by Mac User on 10.06.2022.
//

import SwiftUI

struct UserLoadingView: View {
    var body: some View {
        VStack {
            Text("Updating user")
                .font(.system(size: 40))
            ProgressView()
        }
    }
}

struct UserLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoadingView()
    }
}
