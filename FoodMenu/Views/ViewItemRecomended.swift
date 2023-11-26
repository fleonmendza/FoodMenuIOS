//
//  ViewItemRecomended.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import SwiftUI
import URLImage

struct ViewItemRecomended: View {
    
    let aliment: Aliment
    
    var body: some View {
        NavigationLink(destination: ViewDetailAliment(aliment: aliment)) {
            VStack {
                VStack {
                    URLImage(URL(string: aliment.imagen ?? "")!) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 130)
                            .cornerRadius(10)
                            .padding(8)
                    }
                    .padding(.top,10)
                    Text("Nombre: \(aliment.nombre ?? "")")
                        .font(.headline)
                        .padding(.top, 10)
                        .foregroundColor(.black)
                    
                    Text("Tipo de platillo: \(aliment.tipo_plato ?? "")")
                        .font(.subheadline)
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                        .foregroundColor(.black)
                }
                .frame(width: 220)
                .padding(.horizontal, 30)
               
            }
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 8)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            
        } //navigation
        .onTapGesture {
            print("NavigationLink tapped")
        }
        
    }//View
    
}

#Preview {
    
    ViewItemRecomended(aliment: Aliment(
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

