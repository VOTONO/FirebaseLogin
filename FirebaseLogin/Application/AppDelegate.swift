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
                switch sessionService.isConnectingServer {
                case true:
                    ConnectingServerView()
                case false:
                    switch sessionService.sessionState {
                    case .loggedIn:
                        switch sessionService.isRefreshingUser {
                        case true:
                            UserLoadingView()
                        case false:
                            ProfileView(viewModel: ProfileViewModel(sessionService: sessionService, formBuilder: ProfileFormBuilder()))
                        }
                        case .loggedOut:
                            LoginView(viewModel: LoginViewModel(service: LoginService()))
                        }
                }
            }
        }
    }
}
