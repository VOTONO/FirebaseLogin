//
//  FirstTabView.swift
//  FirebaseLogin
//
//  Created by Mac User on 02.06.2022.
//

import SwiftUI

struct GreetingView: View {
    
    @ObservedObject var viewModel: GreetingViewModel
    
    var body: some View {
        Text("First tab")
    }
}

struct Greeting_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(viewModel: GreetingViewModel())
    }
}
