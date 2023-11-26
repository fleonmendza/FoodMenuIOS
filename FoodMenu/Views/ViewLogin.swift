//
//  ViewLogin.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 11/12/23.
//

import SwiftUI
struct ViewLogin: View {
    
    enum Field {
        case emailAddress
        case password
    }
    
    
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @FocusState private var focusedField: Field?
    @State var isAlertPresented = false
    @State var alertMessage = ""
    @State private var isNavigationActive = false
    
    
    func login() {
        let loginDto = UserLogin(email: email, password: password)
        print("entando a login")
        loginService(loginDto: loginDto) { result in
            switch result {
            case .success(let dictionary):
                print(dictionary)
                if let uidDictionary = dictionary["uid"] as? [String: Any],
                   let localId = uidDictionary["localId"] as? String {
                    
                    print("Local ID:", localId)
                    UserDefaults.standard.set(localId, forKey: "UID")
                    UserDefaults.standard.synchronize()
                    isNavigationActive = true
                }  else if let detail = dictionary["detail"] as? String, detail.lowercased() == "invalid credentials" {
                    // Mostrar la alerta si las credenciales son inválidas
                    alertMessage = "Invalid Credentials"
                    isAlertPresented = true
                } else {
                    // Manejar otros casos
                }
                
            case .failure(let error):
                // Manejar el error en caso de fallo
                alertMessage = "no conexion"
                isAlertPresented = true
                
                print("Error en el inicio de sesión:", error.localizedDescription)
            }
        }
        
    }
    

    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Bienvenido!")
                    .font(.title)
                
                Text("Inicia Sesion")
                    .font(.title2)
                    .padding(.top, 30)
                
                TextField("Correo", text: $email)
                    .focused($focusedField, equals: .emailAddress)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .padding(8)
                    .border(Color.black)
                    .padding(.horizontal, 20)
                    .font(.headline)
                    .padding(.top, 40)
                    .submitLabel(.next)
                
                HStack {
                    ZStack(alignment: .trailing) {
                        TextField("Password", text: $password)
                            .textContentType(.password)
                            .focused($focus1)
                            .opacity(isPasswordVisible ? 1 : 0)
                        
                        SecureField("Password", text: $password)
                            .textContentType(.password)
                            .focused($focus2)
                            .opacity(isPasswordVisible ? 0 : 1)
                        
                        Button(action: {
                            isPasswordVisible.toggle()
                            if isPasswordVisible { focus1 = true } else { focus2 = true }
                        }, label: {
                            Image(systemName: self.isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        })
                    }
                }
                .padding(8)
                .border(Color.black)
                .padding(.horizontal, 20)
                .padding(.top, 40)
                Spacer()
                VStack {
                    NavigationLink("Aun no tienes cuenta? Regístrate!", destination: ViewRegister())
                        .padding(.bottom, 30)
                    Button("Inicia Sesión") {
                        print("precionadoooo")
                        login()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .background(
                        NavigationLink("", destination: ViewHome().navigationBarBackButtonHidden(true), 
                            isActive: $isNavigationActive)
                            .hidden()
                    )
                }
                Spacer()
            }  .alert(isPresented: $isAlertPresented, content: {
                Alert(title: Text("hola"),
                      message: Text("\(alertMessage )"),
                      dismissButton: Alert.Button.default(Text("aceptar")
                 ))
            })
        } // navigationstack
      
    }
}

#Preview {
    ViewLogin()
}
