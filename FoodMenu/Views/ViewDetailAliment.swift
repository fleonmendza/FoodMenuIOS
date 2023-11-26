//
//  ViewDetailAliment.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import SwiftUI
import URLImage

struct ViewDetailAliment: View {
    
    let userUID = UserDefaults.standard.string(forKey: "UID")
    let aliment: Aliment
    
    @State private var isFavorite: Bool = false
    
    private func checkFavoriteStatus() {
            // Obtener los IDs de alimentos favoritos de UserDefaults
            if let favoritoIDs = UserDefaults.standard.array(forKey: "favoritoIDs") as? [Int] {
                // Verificar si el ID del alimento está presente en los IDs guardados
                isFavorite = favoritoIDs.contains(aliment.id ?? 0)
            }
        }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                URLImage(URL(string: aliment.imagen ?? "")!) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding(8)
                }
                .frame(maxWidth: .infinity)
                
                Text("Nombre: \(aliment.nombre ?? "")")
                    .font(.headline)
                    .padding(.top, 10)
                
                Text("Base del platillo: \(aliment.basePlatillo ?? "")")
                    .font(.subheadline)
                    .padding(.top, 10)
                Text("Tiempo de preparación: \(aliment.tiempo_preparacion ?? 0) minutos")
                    .font(.subheadline)
                    .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Ingredientes:")
                        .font(.subheadline)
                        .padding(.top, 10)

                    ForEach(aliment.ingredientes ?? [], id: \.self) { ingrediente in
                        Text("- \(ingrediente)")
                            .font(.subheadline)
                    }
                }
                Text("Descripción: \(aliment.descripcion ?? "")")
                    .font(.subheadline)
                    .padding(.top, 10)
                Spacer()
                Button(action: {
                    
                    
                    // Acciones cuando se presiona el botón
                                   if isFavorite {
                                       // Llamar a la función para eliminar de favoritos
                                       let favService = FavService(userUid: userUID, IdAliment: aliment.id)
                                       delElementFav(data: favService) { result in
                                           switch result {
                                           case .success(let response):
                                               // Manejar la respuesta
                                               print(response)
                                           case .failure(let error):
                                               // Manejar el error
                                               print(error)
                                           }
                                       }
                                   } else {
                                       // Llamar a la función para agregar a favoritos
                                       let favService = FavService(userUid: userUID, IdAliment: aliment.id)
                                       addElementFav(data: favService) { result in
                                           switch result {
                                           case .success(let response):
                                               // Manejar la respuesta
                                               print(response)
                                           case .failure(let error):
                                               // Manejar el error
                                               print(error)
                                           }
                                       }
                                   }
                                   // Cambiar el estado de `isFavorite`
                                   isFavorite.toggle()
                    
                    
                }) {
                    
                    HStack {
                        Spacer()
                        Image(systemName: isFavorite ? "heart.fill" : "heart.slash")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
            
        }
        .onAppear {
                    // Llamar a la función para verificar el estado de favorito
                    checkFavoriteStatus()
                }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 8)
        .navigationBarTitle(aliment.nombre ?? "", displayMode: .inline)
    }
    
}

#Preview {
    ViewDetailAliment(aliment: Aliment(
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
