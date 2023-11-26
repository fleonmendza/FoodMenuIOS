//
//  FavService.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 14/12/23.
//

import Foundation

struct FavService: Codable {
    let userUid: String?
    let IdAliment: Int?
    
    enum CodingKeys: String, CodingKey {
        case userUid = "uid"
        case IdAliment = "id"
        
    }
}
