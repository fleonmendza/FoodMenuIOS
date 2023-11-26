//
//  RegisterUser.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 30/12/23.
//

import Foundation
struct RegisterUser: Codable {
    let email: String?
    let password: String?
//    let uid: String?
    let name: String?
    let lastName: String?
    let age: Int?
    let sexo: String?
//    let height: Int?
//    let weight: Int?
//    let favorites: [Int]?
//    let allergies: [String]?
    
     
     
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
//        case uid = "uid"
        case name = "name"
        case lastName = "lastName"
        case age = "age"
        case sexo = "sexo"
//        case height = "height"
//        case weight = "weight"
//        case allergies = "allergies"
//        case favorites = "favorites"
        
    }
}
