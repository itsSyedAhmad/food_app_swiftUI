//
//  AuthRepo.swift
//  FoodApp
//
//  Created by Saif Ahmad on 08/11/26.
//

import Foundation

final class AuthRepo {
    private let usersKey = "mock_user_key"
    private let defaults: UserDefaults = .standard
    
    func signIn(email: String, password: String) throws ->User {
        let allUsers = try readUsers()
        
        guard let user = allUsers.first(where: { user in
            user.email == email && user.password == password
        }) else {
            throw AuthException.invalidCredentials
        }
        
        return user
    }
    
    func SignUp(email: String,
                password: String,
                fullName: String,
                mobileNumber: String,
                dateOfBirth: String) throws ->User
    {
        var allUsers = try readUsers()
        
        guard let user = allUsers.first(where: { user in
            user.email == email
        }) else {
            let newUser = User(fullName: fullName, password: password, email: email, mobileNumber: mobileNumber, dateOfBirth: dateOfBirth)
            
            allUsers.append(newUser)
            
            try saveUsers(users: allUsers)
            return newUser
        }
        throw AuthException.emailAlreadyExists
    }
    
    func readUsers() throws ->[User] {
        guard let data = defaults.data(forKey: usersKey) else {
            return []
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }

    func saveUsers(users: [User]) throws {
        let allUsers = try JSONEncoder().encode(users)
        
        defaults.setValue(allUsers, forKey: usersKey)
    }
}

enum AuthException: LocalizedError {
    case invalidCredentials
    case emailAlreadyExists
    
    var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Email or password is incorrect."
        case .emailAlreadyExists:
            return "An account with this email already exists."
        }
    }
}
