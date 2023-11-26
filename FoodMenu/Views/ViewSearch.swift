//
//  ViewSearch.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import SwiftUI

struct ViewSearch: View {
    
        @State private var searchText: String = ""
        @State private var searchResults: [Aliment]?
        @State private var isSearching: Bool = false
    

    var body: some View {

        NavigationView {
            VStack {
                ScrollView {
                    // Mostrar los resultados de búsqueda
                    if let searchResults = searchResults {
                        ForEach(searchResults, id: \.id) { aliment in
                            ViewItemRecomended(aliment: aliment)
                                                             .padding(.vertical, 10)
                        }
                    } else {
                        Text("No hay resultados de búsqueda")
                    }
                }
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .automatic),
                prompt: Text("Escribe el alimento que buscas")
            )
            .onChange(of: searchText) { newSearchText in
               
                searchAliment(query: newSearchText) { alimentos in
                    DispatchQueue.main.async {
                     
                        self.searchResults = alimentos
                    }
                }
            }
            .navigationTitle("Busqueda de alimentos")
        }

        
        
        
        
        
        
        
        
        
        
//        VStack{
//            ScrollView{
//                Text("hola")
//            }//scrooll
//        }//vstack
//        .searchable(
//            text: $searchText,
//            placement: .navigationBarDrawer(displayMode: .automatic),
//            prompt: Text("hola"))
        
        
        
        
        
               
    }//View
}

#Preview {
    ViewSearch()
}
