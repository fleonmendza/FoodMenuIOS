//
//  ViewRegister.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 11/12/23.
//

import SwiftUI

struct ViewRegister: View {
    
    enum Field {
          case firstName
          case lastName
          case emailAddress
          case password
          case age
      }
    
    @State var name: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password : String = ""
    @State var age : String = ""
    @State private var isPasswordVisible: Bool = false
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State private var selectedGender: String = "Masculino" // Valor inicial
    @FocusState private var focusedField: Field?
    @State private var isNavigationActive = false
    let genders = ["Masculino", "Femenino", "Otro"]
    @State var isAlertPresented = false
    @State var alertMessage = ""
    
    

    func register() {
            // Crear un objeto RegisterDto con los datos ingresados
            let registerDto = RegisterUser(email: email,
                                           password: password,
//                                           uid: "",
                                           name: name,
                                           lastName: lastName,
                                           age: Int(age),
                                           sexo: selectedGender
//                                           height: 0,
//                                           weight: 0,
//                                           favorites: [],
//                                           allergies: []
            )
        print(registerDto)

            // Llamar al servicio de registro
        registerUser(register: registerDto) { result in
                switch result {
                case .success(let response):
                    print("Registro exitoso: \(response)")

                    alertMessage = "Registro exotoso"
                    isAlertPresented = true
                    DispatchQueue.main.async {
                        // Esto navegará a la vista de inicio de sesión
                        isNavigationActive = true
                    }

                case .failure(let error):
                    // Manejar el error en caso de fallo
                    print("Error en el registro:", error.localizedDescription)

                    alertMessage = "Error al registrarse"
                    isAlertPresented = true
                }
            }
        }

    
    var body: some View {
        ScrollView {
            VStack{
                Text("Registrate!")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                TextField("Nombre", text: $name)
                    .focused($focusedField, equals: .firstName)
                    .keyboardType(.default)
                    .autocorrectionDisabled()
                    .padding(15)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/ )
                    .padding(.horizontal,20)
                    .font(.headline)
                    .padding(.top, 40)
                    .submitLabel(.next)
               
                TextField("Apellidos", text: $lastName)
                    .keyboardType(.default)
                    .autocorrectionDisabled()
                    .padding(15)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/ )
                    .padding(.horizontal,20)
                    .font(.headline)
                    .padding(.top, 35)
                    .submitLabel(.next)
                    .focused($focusedField, equals: .lastName)
                TextField("Correo", text: $email)
                    .focused($focusedField, equals: .emailAddress)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                    .padding(15)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/ )
                    .padding(.horizontal,20)
                    .font(.headline)
                    .padding(.top, 35)
                    .submitLabel(.next)
                HStack {
                        ZStack(alignment: .trailing) {
                            TextField("Password", text: $password)
                                .focused($focusedField, equals: .password)
                                .textContentType(.password)
                                .focused($focus1)
                                .opacity(isPasswordVisible ? 1 : 0)
                                .submitLabel(.next)
                            SecureField("Password", text: $password)
                                .focused($focusedField, equals: .password)
                                .textContentType(.password)
                                .focused($focus2)
                                .opacity(isPasswordVisible ? 0 : 1)
                                .submitLabel(.next)
                            Button(action: {
                                isPasswordVisible.toggle()
                                if isPasswordVisible { focus1 = true } else { focus2 = true }
                            }, label: {
                                Image(systemName: self.isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            })
                        }
                    }
                    .padding(8)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/ )
                    .padding(.horizontal,20)
                    .padding(.top, 40)
                VStack {
                    Text("Sexo:")
                        
                    Picker("Género", selection: $selectedGender) {
                                    ForEach(genders, id: \.self) { gender in
                                        Text(gender)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                                .padding(EdgeInsets(top: 10, leading: 40, bottom: 20, trailing: 40))
                
                }.padding(.top, 10)
                
               
                TextField("Edad", text: $age)
                    .focused($focusedField, equals: .age)
                    .keyboardType(.numberPad)
                    .autocorrectionDisabled()
                    .padding(15)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/ )
                    .padding(.horizontal,20)
                    .font(.headline)
                    .padding(.top, 35)
                
            }
            
            VStack{
                Button("Registrate"){
                    register()
                                    }
              
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                    .background(
                                        NavigationLink("", destination: ViewLogin().navigationBarBackButtonHidden(true),
                                            isActive: $isNavigationActive)
                                            .hidden()
                                    )
            }.padding(.top, 25)
            Spacer()
        }.alert(isPresented: $isAlertPresented, content: {
            Alert(title: Text("hola"),
                  message: Text("\(alertMessage )"),
                  dismissButton: Alert.Button.default(Text("aceptar")
             ))
        })
      
    
           
    }
}

#Preview {
    ViewRegister()
}
