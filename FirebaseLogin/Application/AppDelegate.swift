//
//  AppDelegate.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Firebase_User_Account_ManagementApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionService()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionService.state {
                    case .loggedIn:
                    ProfileView(viewModel: ProfileViewModel(), formBuilder: ProfileFormBuilder(), service: sessionService)
                    case .loggedOut:
                        LoginView(viewModel: LoginViewModel(service: LoginService()))
                    }
                
            }
        }
    }
}
