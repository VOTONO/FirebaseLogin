//
//  ConnectingServerView.swift
//  FirebaseLogin
//
//  Created by Mac User on 10.06.2022.
//

import SwiftUI

struct ConnectingServerView: View {
    var body: some View {
        VStack {
            Text("Connect to server")
                .font(.system(size: 40))
            ProgressView()
        }
    }
}

struct ConnectingServerView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectingServerView()
    }
}
