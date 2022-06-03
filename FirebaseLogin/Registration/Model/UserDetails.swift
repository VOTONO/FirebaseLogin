//
//  UserRegister.swift
//  FirebaseLogin
//
//  Created by Mac User on 30.05.2022.
//

import Foundation

struct UserDetails: Equatable {

    let firstName: String
    let lastName: String
    let password: String
    let email: String
    let birthday: String
}

extension UserDetails {
    static var new: UserDetails {
     UserDetails(firstName: "",
                  lastName: "",
                  password: "",
                  email: "",
                  birthday: "" )
    }
}
