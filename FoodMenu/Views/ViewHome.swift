//
//  ViewHome.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 11/12/23.
//

import SwiftUI

struct ViewHome: View {
    var body: some View {
        
        NavigationStack {
            TabView{
                ViewRecomended()
                    .tabItem { Image(systemName: "wand.and.stars.inverse")
                    Text("Recomendados")}
                ViewSearch()
                    .tabItem { Image(systemName: "magnifyingglass")
                    Text("Buscar")}
                ViewFavorites()
                    .tabItem { Image(systemName: "heart")
                    Text("Favoritos")}
                ViewUser()
                    .tabItem { Image(systemName: "person")
                    Text("Perfil")}
            }
        }//tabview
        
        
    }
}

#Preview {
    ViewHome()
}
