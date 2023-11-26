//
//  ViewItemFavorites.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 14/12/23.
//

import SwiftUI
import URLImage

struct ViewItemFavorites: View {
    
    let aliment: Aliment
    
    
    var body: some View {
        NavigationLink(destination: ViewDetailAliment(aliment: aliment)) {
                   VStack {
                       URLImage(URL(string: aliment.imagen ?? "")!) { image in
                           image
                               .resizable()
                               .scaledToFill()
                               .frame(maxWidth: 120, maxHeight: 130)
                               .cornerRadius(10)
                               .padding(8)
                           
                       }
                       .padding(.top, 10)

                       Text(" \(aliment.nombre ?? "")")
                           .font(.headline)
                           .padding(.top, 10)
                           .foregroundColor(.black)

                       Text("Tipo de platillo: \(aliment.tipo_plato ?? "")")
                           .font(.subheadline)
                           .padding(.top, 10)
                           .padding(.bottom, 20)
                           .foregroundColor(.black)
                   }
                   .frame(maxWidth: 180, maxHeight:210)
                   .background(Color.gray)
                   .clipShape(RoundedRectangle(cornerRadius: 10))
                   .shadow(radius: 8)
                   .padding(.vertical, 10)
               }
    }
}

#Preview {
    ViewItemFavorites(aliment: Aliment(
        id: 1,
        nombre: "Platillo de Muestra",
        imagen: "https://cocinemosjuntos.com.co/media/mageplaza/blog/post/t/i/tips-para-preparar-pollo-al-horno-jugoso-y-perfecto_1_.jpg",
        descripcion: "Descripción de muestra para el platillo",
        dificultad: "Fácil",
        tiempo_preparacion: 30,
        tipo_plato: "Entrada",
        basePlatillo: "Arroz",
        estilo_cocina: "Internacional",
        restricciones_dieteticas: ["Vegetariano", "Bajo en grasas"],
        ingredientes: ["Arroz", "Verduras"]
    ))
}
