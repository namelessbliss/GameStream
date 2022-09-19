//
//  GamesView.swift
//  GameStream
//
//  Created by adolfo pardo on 5/09/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]
    
    let formaGrid = [
        
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    
    var body: some View {
        
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView{
                    
                    LazyVGrid(columns:  formaGrid, spacing: 8){
                        
                        ForEach(todosLosVideojuegos.gamesInfo, id: \.self){
                            
                            juego in
                            
                            Button(action: {
                                
                                url = juego.videosUrls.mobile
                                titulo = juego.title
                                studio = juego.studio
                                calificacion = juego.contentRaiting
                                anoPublicacion = juego.publicationYear
                                descripcion = juego.description
                                tags = juego.tags
                                imgsUrl = juego.galleryImages
                                
                                print("Pulse el juego \(titulo)")
                                
                                gameViewIsActive = true
                                
                            }, label: {
                                
                                KFImage(URL(string: juego.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                    .padding(.bottom, 12)
                                
                            })
                            
                        }
                        
                    }
                    
                }
                
            }.padding(.horizontal, 6)
            
            NavigationLink(destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
                           isActive: $gameViewIsActive,
                           label: {
                EmptyView()
            })
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    print("Primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
                    
                    print("Titulo del primer videojuego del json \(todosLosVideojuegos.gamesInfo[0].title)")
                    
                }
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
