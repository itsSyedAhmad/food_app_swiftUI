//
//  AuthController.swift
//  FoodApp
//
//  Created by Saif Ahmad on 08/11/26.
//

import Combine
import SwiftUI

final class AuthController: ObservableObject {
    @Published var user: User?
    @Published var apiStatus: ApiStatus = .initial
    
    private let authRepo = AuthRepo()
    
    func signIn(email: String, password: String) {
        
        
        print("Sign in")
        apiStatus = .loading
        do {
            user = try authRepo.signIn(email: email, password: password)
            apiStatus = .success
            
            print("success")
        }
        catch {
            apiStatus = .failure
            user = nil
            print("failure")
        }
        
        print(user?.fullName)
    }
    
    func signUp(email: String,
                password: String,
                fullName: String,
                mobileNumber: String,
                dateOfBirth: String)
    {
        
        print("inside signup function")
        apiStatus = .loading
        do {
            user = try authRepo.SignUp(email: email, password: password, fullName: fullName, mobileNumber: mobileNumber, dateOfBirth: dateOfBirth)
            apiStatus = .success
            
            print("success")
        }
        catch {
            apiStatus = .failure
            user = nil
            print("failure")
        }
    }
}

enum ApiStatus {
    case initial
    case loading
    case success
    case failure
}
