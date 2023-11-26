//
//  Aliment.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import Foundation

struct Aliment: Codable {
    let id: Int?
    let nombre: String?
    let imagen: String?
    let descripcion: String?
    let dificultad: String?
    let tiempo_preparacion: Int?
    let tipo_plato: String?
    let basePlatillo: String?
    let estilo_cocina: String?
    let restricciones_dieteticas: [String]?
    let ingredientes: [String]?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nombre = "name"
        case imagen = "img"
        case descripcion = "description"
        case dificultad = "dificult"
        case tiempo_preparacion = "time_preparation"
        case tipo_plato = "dish_type"
        case basePlatillo = "baseDish"
        case estilo_cocina = "style_food"
        case restricciones_dieteticas = "componentsDisc"
        case ingredientes = "ingredients"
    }
}
