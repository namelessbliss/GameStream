//
//  SearchGame.swift
//  GameStream
//
//  Created by adolfo pardo on 24/09/22.
//

import Foundation

class SearchGame: ObservableObject {
    
    //Recuperar todos los juegos
    @Published var gameInfo = [Game]()
    
    //Retornar los juegos que provengan de la api de busqueda segun el nombre
    func search(gameName:String){
        
        print("Buscando : \(gameName)")
        
        gameInfo.removeAll()
    
        //Permite tener espacios en la url de la peticion
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            do{
                
                if let jsonData = data {
                    
                    print("tamaño del JSON \(jsonData)")
                    
                    let decodedData = try JSONDecoder().decode(Resultados.self, from: jsonData)
                    
                    print("JSONDecodificado: \(decodedData)")
                    
                    DispatchQueue.main.async {
                        
                        self.gameInfo.append(contentsOf: decodedData.results)
                        
                    }
                    
                }else{
                    
                    print("No existen datos en el json recuperado")
                        
                }
                
            }catch{
                
                print("Error : \(error)")
                
            }
            
        }.resume()
        
    }
    
}
