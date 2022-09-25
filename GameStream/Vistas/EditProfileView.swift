//
//  EditProfileView.swift
//  GameStream
//
//  Created by adolfo pardo on 25/09/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            ScrollView{
                VStack{
                    
                    Text("Editar Perfil")
                    
                    Button(action: {}, label: {
                        
                        ZStack {
                            
                            Image("perfilEjemplo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                            
                        }
                        
                    })
                    
                    ModuloEditar()
                    
                }.padding(.bottom, 18.0)
            }
        }
        
    }
}

struct ModuloEditar:View {
    
    @State var correo: String = ""
    @State var contraseña: String = ""
    @State var nombre: String = ""
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            Text("Correo electrónico")
                .foregroundColor(Color("Dark-Cian"))
            
            ZStack(alignment: .leading){
                
                if correo.isEmpty{
                    
                    Text("ejmplo@icloud.com")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 117/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                TextField("", text: $correo)
                    .foregroundColor(.white)
                
            }
            
            Divider().frame(height: 1.0)
                .background(Color("Dark-Cian"))
            
            
            Text("Contraseña")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                
                if contraseña.isEmpty{
                    
                    Text("Introduce tu contraseña")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 117/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                SecureField("", text: $contraseña)
                    .foregroundColor(.white)
                
            }
            
            Divider().frame(height: 1.0)
                .background(Color("Dark-Cian"))
            
            
            Text("Nombre")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading){
                
                if correo.isEmpty{
                    
                    Text("Introduce tu nombre de usuario")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 117/255, blue: 185/255, opacity: 1.0))
                    
                }
                
                TextField("", text: $nombre)
                    .foregroundColor(.white)
                
            }
            
            Divider().frame(height: 1.0)
                .background(Color("Dark-Cian"))
                .padding(.bottom, 32)
            
            
            Button(action: {actualizarDatos()}, label: {
                
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color("Dark-Cian"),
                                lineWidth: 3).shadow(color: .white, radius: 6))
                
            }).padding(.bottom)
            
        }.padding(.horizontal, 42.0)
        
    }
    
    func actualizarDatos() {
        print("Guardando y recuperando datos del usuario")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
