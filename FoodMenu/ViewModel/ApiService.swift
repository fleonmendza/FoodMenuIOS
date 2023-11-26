//
//  ApiService.swift
//  FoodMenu
//
//  Created by Esteban Federico León Mendoza on 12/12/23.
//

import Foundation



func obtenerAlimentos(completionHandler: @escaping ([Aliment]?) -> Void) {
    guard let url = URL(string: "\(BASE_URL)alimentsList") else {
        completionHandler(nil)
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Ocurrió un error: \(error)")
            completionHandler(nil)
            return
        }

        do {
            guard let data = data else {
                print("No se recibieron datos")
                completionHandler(nil)
                return
            }

            let alimentos = try JSONDecoder().decode([Aliment].self, from: data)
            completionHandler(alimentos)
        } catch {
            print("Ocurrió un error al decodificar los datos: \(error)")
            completionHandler(nil)
        }
    }

    task.resume()
}




func loginService(loginDto: UserLogin, completionHandler: @escaping (Result<Dictionary<String, Any>, Error>) -> Void) {
    let url = URL(string: "\(BASE_URL)login")!
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        request.httpBody = try JSONEncoder().encode(loginDto)
    } catch {
        completionHandler(.failure(error))
        return
    }
    
    let defaultSession = URLSession(configuration: .ephemeral)
    let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        // Manejar la respuesta aquí
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        
        do {
            if let data = data {
                let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                completionHandler(.success(dictionary))
            } else {
                completionHandler(.failure(NSError(domain: "Error de datos", code: 0, userInfo: nil)))
            }
        } catch let error {
            completionHandler(.failure(error))
        }
    }
    
    dataTask.resume()
}


func obtenerAlimentosFav(userUID: String, completionHandler: @escaping ([Aliment]?) -> Void) {
    // Construye la URL con el parámetro userUID
    guard let url = URL(string: "\(BASE_URL)alimentsListFavorites/\(userUID)") else {
        completionHandler(nil)
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Ocurrió un error: \(error)")
            completionHandler(nil)
            return
        }

        do {
            guard let data = data else {
                print("No se recibieron datos")
                completionHandler(nil)
                return
            }

            let alimentos = try JSONDecoder().decode([Aliment].self, from: data)
            completionHandler(alimentos)
        } catch {
            print("Ocurrió un error al decodificar los datos: \(error)")
            completionHandler(nil)
        }
    }

    task.resume()
}

func addElementFav(data: FavService, completionHandler: @escaping (Result<Dictionary<String, Any>, Error>) -> Void) {
    let url = URL(string: "\(BASE_URL)add_element")!
    var request = URLRequest(url: url)
    
    request.httpMethod = "PUT"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        request.httpBody = try JSONEncoder().encode(data)
    } catch {
        completionHandler(.failure(error))
        return
    }
    
    let defaultSession = URLSession(configuration: .ephemeral)
    let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        // Manejar la respuesta aquí
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        
        do {
            if let data = data {
                let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                completionHandler(.success(dictionary))
            } else {
                completionHandler(.failure(NSError(domain: "Error de datos", code: 0, userInfo: nil)))
            }
        } catch let error {
            completionHandler(.failure(error))
        }
    }
    
    dataTask.resume()
}

func delElementFav(data: FavService, completionHandler: @escaping (Result<Dictionary<String, Any>, Error>) -> Void) {
    let url = URL(string: "\(BASE_URL)remove_element")!
    var request = URLRequest(url: url)
    
    request.httpMethod = "PUT"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        request.httpBody = try JSONEncoder().encode(data)
    } catch {
        completionHandler(.failure(error))
        return
    }
    
    let defaultSession = URLSession(configuration: .ephemeral)
    let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        // Manejar la respuesta aquí
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        
        do {
            if let data = data {
                let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                completionHandler(.success(dictionary))
            } else {
                completionHandler(.failure(NSError(domain: "Error de datos", code: 0, userInfo: nil)))
            }
        } catch let error {
            completionHandler(.failure(error))
        }
    }
    
    dataTask.resume()
}





func searchAliment(query: String, completionHandler: @escaping ([Aliment]?) -> Void) {
    guard !query.isEmpty else {
        completionHandler(nil)
        return
    }

    let url = URL(string: "\(BASE_URL)searchAliments?query=\(query)")!
    var request = URLRequest(url: url)

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Ocurrió un error: \(error)")
            completionHandler(nil)
            return
        }

        do {
            guard let data = data else {
                print("No se recibieron datos")
                completionHandler(nil)
                return
            }

            let alimentos = try JSONDecoder().decode([Aliment].self, from: data)
            completionHandler(alimentos)
        } catch {
            print("Ocurrió un error al decodificar los datos: \(error)")
            completionHandler(nil)
        }
    }

    task.resume()
}


func obtenerDatosUsuario(userUID: String, completionHandler: @escaping (User?) -> Void) {
    // Construye la URL con el parámetro userUID
    guard let url = URL(string: "\(BASE_URL)userData/\(userUID)") else {
        completionHandler(nil)
        return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Ocurrió un error: \(error)")
            completionHandler(nil)
            return
        }

        do {
            guard let data = data else {
                print("No se recibieron datos")
                completionHandler(nil)
                return
            }

            let usuario = try JSONDecoder().decode(User.self, from: data)
            completionHandler(usuario)
        } catch {
            print("Ocurrió un error al decodificar los datos: \(error)")
            completionHandler(nil)
        }
    }

    task.resume()
}


func registerUser(register: RegisterUser, completionHandler: @escaping (Result<Dictionary<String, Any>, Error>) -> Void) {
    let url = URL(string: "\(BASE_URL)register")!
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        request.httpBody = try JSONEncoder().encode(register)
    } catch {
        completionHandler(.failure(error))
        return
    }
    
    let defaultSession = URLSession(configuration: .ephemeral)
    let dataTask = defaultSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
        // Manejar la respuesta aquí
        if let error = error {
            completionHandler(.failure(error))
            return
        }
        
        do {
            if let data = data {
                let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! Dictionary<String, Any>
                completionHandler(.success(dictionary))
            } else {
                completionHandler(.failure(NSError(domain: "Error de datos", code: 0, userInfo: nil)))
            }
        } catch let error {
            completionHandler(.failure(error))
        }
    }
    
    dataTask.resume()
}


