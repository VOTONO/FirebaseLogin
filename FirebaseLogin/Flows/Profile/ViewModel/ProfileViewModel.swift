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
    
    let formBuilder: ProfileFormBuilder
    let sessionService: SessionService
    
    init(sessionService: SessionService, formBuilder: ProfileFormBuilder) {
        self.formBuilder = formBuilder
        self.sessionService = sessionService
        updateUser()
    }
    
     func updateUser() {
        for userDetail in sessionService.userDetails {
            guard let index = formBuilder.content.firstIndex(where: { $0.fieldId == userDetail.fieldId }) else {
                print("No Index"); return}
            print("Updating value: \(userDetail.value) in component: \(formBuilder.content[index])")
            self.formBuilder.update(userDetail.value, in: self.formBuilder.content[index])
        }
    }
}
