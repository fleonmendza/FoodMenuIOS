//
//  ContentView.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 26/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       

  
            Group {
                if let uid = UserDefaults.standard.object(forKey: "UID") as? String {
                    ViewHome()
                        .onAppear {
                            print("UID almacenado en UserDefaults:", uid)
                        }
                } else {
                    // No se encontró un valor para la clave "UID" en UserDefaults
                    ViewLogin()
                        .onAppear {
                            print("No se encontró un valor para la clave 'UID' en UserDefaults")
                        }
                }
            }
        
        
        
        
        }
}

#Preview {
    ContentView()
}
