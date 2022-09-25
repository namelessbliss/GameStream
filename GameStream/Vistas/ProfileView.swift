//
//  ProfileView.swift
//  GameStream
//
//  Created by adolfo pardo on 25/09/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario = "Adolfo"
    
    var body: some View {
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack {
                
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .padding()
                
                VStack{
                    
                    Image("perfilEjemplo").resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118.0, height: 118.0)
                        .clipShape(Circle())
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
                
                ModuloAjustes()
                
            }
            
            
        }.onAppear(
            
            perform: {
                print("Revisando si tengo datos de usuario en mis UserDefaults")
            }
            
        )
    }
    
}

struct ModuloAjustes: View {
    var body: some View{
        
        Text("Hola")
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
