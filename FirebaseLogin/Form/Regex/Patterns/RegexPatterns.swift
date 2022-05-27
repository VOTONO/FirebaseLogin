//
//  RegexPatterns.swift
//  FirebaseLogin
//
//  Created by Mac User on 27.05.2022.
//

import Foundation

struct RegexPatterns{
    static let email = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
    static let higherThanSix = "^.{6,}$"
    static let emptyString = "^.{1,}$"
}
