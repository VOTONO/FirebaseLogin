//
//  LoadingView.swift
//  FirebaseLogin
//
//  Created by Mac User on 14.06.2022.
//

import SwiftUI

struct LoadingView: View {
    
    var text: String
    
    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 30))
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Connecting to Server")
    }
}
