//
//  LoginUser.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 13/12/23.
//

import Foundation

struct UserLogin: Codable {
    let email: String?
    let password: String?
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
        
    }
}
