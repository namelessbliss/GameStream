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
                    
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    
                    if contraseña.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $contraseña).foregroundColor(.white)
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
    
    @State var correo = ""
    @State var contraseña = ""
    @State var confirmarContraseña = ""
    
    var body: some View{
        
        ScrollView {
            
            VStack(alignment: .center){
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: tomarFoto, label: {
                    ZStack {
                        Image("perfilEjemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera").foregroundColor(.white)
                    }
                })
                .padding(.bottom)
            }
            
            
            VStack{
                
                VStack(alignment: .leading){
                    
                    Text("Correo Electrónico*").foregroundColor(Color("Dark-Cian"))
                        .frame(width: 300, alignment: .leading)
                    
                    ZStack(alignment: .leading){
                        
                        if correo.isEmpty {
                            Text("ejemplo@gmail .com").font(.caption).foregroundColor(.gray)
                        }
                        
                        TextField("", text: $correo).foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    
                    Text("Contraseña").foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        
                        if contraseña.isEmpty {
                            Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $contraseña).foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                    
                    Text("Confirmar Contraseña").foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        
                        if contraseña.isEmpty {
                            Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $confirmarContraseña).foregroundColor(.white)
                    }
                    
                    Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                }
                
                Button(action: registrate, label: {
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                            .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                            .shadow(color: .white, radius: 6))
                }).padding(.bottom,32)
                
                Text("Registrate con redes sociales")
                    .foregroundColor(.white)
                    .frame(width: 300, alignment: .center)
                    .padding(.bottom)
                
                
                HStack{
                    Button(action: {print("Registro con Facebook")}) {
                        Text("Facebook")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 12.0)
                        //.background(Color(red: 36/255, green: 57/255, blue: 91/255, opacity: 1.0))
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                    
                    Button(action: {print("Registro con Twitter")}) {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical, 12.0)
                        //.background(Color(red: 36/255, green: 57/255, blue: 91/255, opacity: 1.0))
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                }
                
                
            }.padding(.horizontal, 77)
        }
    }
}

func tomarFoto(){
    print("Tomar fotografía de perfil")
}

func registrate(){
    print("Registro de usuario")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla01").resizable()
        ContentView()
    }
}
