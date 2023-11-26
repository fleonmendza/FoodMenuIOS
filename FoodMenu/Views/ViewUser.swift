//
//  ViewUser.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import SwiftUI

struct ViewUser: View {
    
    @State private var usuario: User?
    
    let userUID = UserDefaults.standard.string(forKey: "UID")
    
    private func obtenerDatosUser() {
        obtenerDatosUsuario(userUID: userUID ?? "") { (usuarioObtenido) in
            
            DispatchQueue.main.async {
                self.usuario = usuarioObtenido
                
            }
        }
    }
    
    
    var body: some View {
        VStack {
                    VStack(alignment: .leading) {
                        Text("Hola \(usuario?.name ?? "")")
                            .font(.title)
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        Text("Tu correo: \(usuario?.email ?? "")")
                            .font(.headline)
                            .padding(.top, 20)
                        Text("Tu edad: \(usuario?.age ?? 0) años")
                            .font(.headline)
                            .padding(.top, 10)
                        Text("Sexo: \(usuario?.sexo ?? "")")
                            .font(.headline)
                            .padding(.top, 10)
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Alergias:")
                                .font(.headline)
                                .padding(.top, 10)

                            ForEach(usuario?.allergies ?? [], id: \.self) { alergia in
                                Text("- \(alergia)")
                                    .font(.subheadline)
                            }
                        }
                        
                        Spacer()
                        
                        HStack {
                            Spacer() // Espaciado para alinear el botón al centro
                            Button("Cerrar Sesión") {
                                // Lógica para cerrar sesión
                                UserDefaults.standard.removeObject(forKey: "UID")
                                // También podrías realizar otras tareas de cierre de sesión si es necesario
                                
                                // Navegar a la vista de inicio de sesión
                                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                    if let window = windowScene.windows.first {
                                        window.rootViewController = UIHostingController(rootView: ViewLogin())
                                    }
                                }
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                            Spacer() // Espaciado para alinear el botón al centro
                        }.padding(.bottom, 20)
                    }
                    .padding(.horizontal, 20)
                }
                .onAppear {
                    obtenerDatosUser()
                }
        
    }}

#Preview {
    ViewUser()
}
