//
//  GameView.swift
//  GameStream
//
//  Created by adolfo pardo on 7/09/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url: String
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    var imgsUrl: [String]
    
    var body: some View {
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack {
                
                video(url: url).frame(height: 300)
                
                ScrollView {
                    
                    //TODO Informacion Video
                    videoInfo(titulo: titulo,
                              studio: studio,
                              calificacion: calificacion,
                              anoPublicacion: anoPublicacion,
                              descripcion: descripcion,
                              tags: tags)
                    .padding(.bottom)
                    
                    Gallery(imgsUrl: imgsUrl)
                        .padding(.bottom)
                    
                    
                    Comentarios()
                        .padding(.bottom)
                    
                    
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct video: View{
    
    var url: String
    
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo:View{
    
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                
                ForEach(tags, id:\.self){
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
                
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct Gallery:View{
    
    var imgsUrl: [String]
    
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid, spacing: 8){
                    
                    ForEach(imgsUrl, id: \.self){
                        
                        imgUrl in
                        
                        //Desplegar imagenes del servidor por medio de la url
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    
                }
                
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct Comentarios:View{
    
    var body: some View{
        
        VStack (alignment: .leading){
            
            Text("Comentarios")
                .foregroundColor(.white)
                .font(.title2)
                .padding(.leading)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
        ComentariosItems()
        ComentariosItems()
        
    }
}

struct ComentariosItems:View{
    var body: some View{
        
        VStack (alignment: .leading){
            
            VStack{
                
            HStack{
                
                Image("perfilEjemplo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                
                VStack {
                    
                    Text("Geoff Atto")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Text("Hace 7 días")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }
            
            Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmmenso mapa y actividades.")
                    .foregroundColor(.white)
            }.padding(18)
                .background(Color("Blue-Gray"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,18)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog",
                 studio: "Sega",
                 calificacion: "E+",
                 anoPublicacion: "1991",
                 descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
                 tags:["plataformas","mascota"],
                 imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
                          ])
    }
}
