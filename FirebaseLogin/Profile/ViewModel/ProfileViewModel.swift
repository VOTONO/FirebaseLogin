//
//  ProfileViewModel.swift
//  FirebaseLogin
//
//  Created by Mac User on 03.06.2022.
//

import Foundation
import SwiftUI

protocol ProfileViewModelProtocol {
}

final class ProfileViewModel: ObservableObject, ProfileViewModelProtocol {
    
    @Published var userDetails = UserDetails.new
}
