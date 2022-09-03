//
//  Home.swift
//  GameStream
//
//  Created by adolfo pardo on 3/09/22.
//

import SwiftUI

struct Home: View {
    
    @State var tabSeleccionado:Int = 2
    var body: some View {
        
        TabView(selection: $tabSeleccionado){
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            Text("Pantalla Inicio").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
