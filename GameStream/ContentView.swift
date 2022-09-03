//
//  ContentView.swift
//  GameStream
//
//  Created by adolfo pardo on 30/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                Spacer()
                
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0).ignoresSafeArea()
                
                VStack{
                    HStack {
                        Image("appLogoGame").resizable().aspectRatio(contentMode: .fit)
                        Image("appLogo").resizable().aspectRatio(contentMode: .fit)
                    }.frame(width: 250, height: 20).padding(.bottom, 42)
                    
                    InicioYRegistroview()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct InicioYRegistroview: View {
    
    @State var tipoInicioSesion = true
    
    var body: some View{
        
        VStack{
            
            HStack {
                
                Spacer()
                
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    print("Pantalla inicio sesión")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla de registro")
                }
                .foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true{
                InicioSesionView()
            }else{
                RegistroView()
            }
        }
    }
}

struct InicioSesionView: View {
    
    @State var correo = ""
    @State var contraseña = ""
    @State var isPantallaHomeActive = false
    
    var body: some View{
        
        ScrollView {
            VStack (alignment: .leading){
                
                Text("Correo Electrónico").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty {
                        Text("ejemplo@gmail .com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    
                    if contraseña.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contraseña)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?").font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                            .shadow(color: .white, radius: 6))
                }).padding(.bottom,32)
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .frame(width: 300, alignment: .center)
                    .padding(.bottom)
                
                
                HStack{
                    Text("Facebook").foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .background(Color(red: 36/255, green: 57/255, blue: 91/255, opacity: 1.0))
                    Text("Twitter").foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .background(Color(red: 36/255, green: 57/255, blue: 91/255, opacity: 1.0))
                }
                
                
            }.padding(.horizontal, 77)
            
            NavigationLink(
                destination: Home(),
                isActive: $isPantallaHomeActive,
                label: {
                    EmptyView()
                })
        }
    }
    
    func iniciarSesion() {
        print("Iniciando sesion")
        
        isPantallaHomeActive = true
    }
}

struct RegistroView: View {
    var body: some View{
        
        Text("Soy la vista de Registro")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla01").resizable()
        ContentView()
    }
}
