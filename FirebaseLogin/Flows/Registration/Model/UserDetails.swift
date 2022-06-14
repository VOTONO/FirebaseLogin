//
//  UserRegister.swift
//  FirebaseLogin
//
//  Created by Mac User on 30.05.2022.
//

import Foundation

struct UserDetails: Equatable {

    var firstName: String
    var lastName: String
    var password: String
    var email: String
    var birthday: String
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
