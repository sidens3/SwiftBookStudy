//
//  User.swift
//  PersonalQuiz
//
//  Created by Михаил Зиновьев on 31.10.2021.
//

import Foundation

protocol User {
    func getAuthData() -> AuthData
    func getPersonalData() -> PersonalData
}

class DeveloperUser: User {
    private let authData = AuthData()
    private let personalData = PersonalData()
    
    func getAuthData() -> AuthData {
        return authData
    }
    
    func getPersonalData() -> PersonalData {
        return personalData
    }
}

struct AuthData {
    let login = "User"
    let password = "Password"
}

struct PersonalData {
    let name = "Mikhail"
    let secondName = "Zinovev"
    let age = 26
    let profession = "Automation QA"
    let favoritePet = "Cats"
}
