//
//  GamesView.swift
//  GameStream
//
//  Created by adolfo pardo on 5/09/22.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Pantalla Juegos").font(.system(size: 30, weight: .bold, design: .rounded))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    print("Primer elemento del json:")
                    
                    print("Titulo del primer videojuego del json")
                }
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
