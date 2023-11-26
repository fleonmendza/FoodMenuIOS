//
//  ViewFavorites.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import SwiftUI

struct ViewFavorites: View {
    
    @State private var alimentos: [Aliment]?
    
    
    let userUID = UserDefaults.standard.string(forKey: "UID")
    
    
    private func obtenerDatos() {
        obtenerAlimentosFav(userUID: userUID ?? "") { (alimentObtenido) in
            
            DispatchQueue.main.async {
                self.alimentos = alimentObtenido
                let favoritoIDs = alimentObtenido?.compactMap { $0.id }
                UserDefaults.standard.set(favoritoIDs, forKey: "favoritoIDs")
                
            }
        }
    }
    
    
    
    
    var body: some View {
        
//        VStack {
//            if alimentos != nil {
//                ScrollView {
//                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
//                        ForEach(alimentos!, id: \.id) { aliment in
//                            ViewItemFavorites(aliment: aliment)
//                                .padding(.vertical, 10)
//                        }
//                    }
//                    .padding(16)
//                }
//                
//            }
//            else {
//                Spacer()
//                ProgressView("Cargando...")
//                    .progressViewStyle(CircularProgressViewStyle())
//                Spacer()
//            }
//        } .onAppear {
//            obtenerDatos()
//        }
        
        
        
        
        VStack {
            if let alimentos = alimentos {
                if alimentos.isEmpty || (alimentos.count == 1 && alimentos[0].id == 0) {
                    // No hay alimentos favoritos definidos
                    Text("No hay alimentos favoritos.")
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                } else {
                    // Hay alimentos favoritos, mostrar la lista
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                            ForEach(alimentos, id: \.id) { aliment in
                                ViewItemFavorites(aliment: aliment)
                                    .padding(.vertical, 10)
                            }
                        }
                        .padding(16)
                    }
                }
            } else {
                Spacer()
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
        }
        .onAppear {
            obtenerDatos()
        }
        
        
        
        
        
        
        
    }
}

#Preview {
    ViewFavorites()
}
