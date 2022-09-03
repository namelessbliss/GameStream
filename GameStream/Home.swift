//
//  Home.swift
//  GameStream
//
//  Created by adolfo pardo on 3/09/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        TabView{
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }
            
            Text("Pantalla Inicio").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "house")
                    Text("Inicio")
                }
            
            Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favoritos")
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
