//
//  User.swift
//  PersonalQuiz
//
//  Created by Михаил Зиновьев on 31.10.2021.
//

import Foundation

struct User {
    let authData = AuthData()
    let data = PersonalData()
}

struct AuthData {
    let login = "User"
    let password = "Password"
}

struct PersonalData {
    let name = "Mikhail"
    let secondName = "Zinovev"
}
