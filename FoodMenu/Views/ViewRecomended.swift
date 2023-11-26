//
//  ViewRecomended.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import SwiftUI

struct ViewRecomended: View {
    
    
    @State private var alimentos: [Aliment]?
    
    
    private func obtenerDatos() {
        obtenerAlimentos { (alimentObtenido) in
            
            DispatchQueue.main.async {
                self.alimentos = alimentObtenido
            }
        }
    }
    
    
    var body: some View {
        VStack {
            if alimentos != nil {
                ScrollView {
                    VStack {
                        ForEach(alimentos!, id: \.id) { aliment in
                            ViewItemRecomended(aliment: aliment)
                                .padding(.vertical, 10)
                        }
                    }
                }
                
            } else {
                Spacer()
                ProgressView("Cargando...")
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
        }.onAppear {
            obtenerDatos()
        }
    }

    
    
}

#Preview {
    ViewRecomended()
}
