//
//  SaveData.swift
//  GameStream
//
//  Created by adolfo pardo on 25/09/22.
//

import Foundation

class SaveData {
    
    var correo:String = ""
    var contraseña:String = ""
    var nombre: String = ""
    
    func guardarDatos(correo:String, contraseña:String, nombre:String) -> Bool {
        
        print("Dentro de la funcion guardar datos obtuve: \(correo) + \(contraseña) + \(nombre)")
        
        UserDefaults.standard.set([correo, contraseña, nombre], forKey: "datosUsuario")
        
        return true
        
    }
    
    func recuperarDatos() -> [String] {
        
        let datosUsuario:[String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("Estoy en el metodo recuperarDatos y recuperé: \(datosUsuario)")
        
        return datosUsuario
    }
    
    func validar(correo:String, contrasena:String) -> Bool {
        
        var correoGuardado = ""
        var contraseñaGuardada = ""
        
        print("Revisando si tengo datos en user defaults con el correo \(correo) y la contraseña \(contrasena)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            contraseñaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            
            print("El correo guardado es \(correoGuardado) y la contraseña guardada es \(contraseñaGuardada)")
            
            if(correo == correoGuardado && contrasena == contraseñaGuardada){
                
                return true
            }else{
                return false
            }
            
        }else{
            
            print("No hay datos de usuario guardados en el user defaults")
            
            return false
            
        }
        
    }
    
}
