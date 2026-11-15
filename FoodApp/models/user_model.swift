//
//  user_model.swift
//  FoodApp
//
//  Created by Saif Ahmad on 08/11/26.
//

import Foundation

struct User : Codable {
    let fullName : String
    let password : String
    let email : String
    let mobileNumber : String
    let dateOfBirth : String
}
