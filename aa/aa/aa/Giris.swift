//
//  Giris.swift
//  aa
//
//  Created by depo on 9.07.2024.
//

import SwiftUI

struct Giris: View {
    @State var index = 0
    @Namespace var name
    
    var body: some View {
        NavigationView{
        VStack{
        
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140 )
                .clipShape(Circle())
            HStack(spacing: 0){
                Button(action: {
                    withAnimation(.spring()){
                        index = 0
                    }
                }) {
                  VStack{
                    Text("Yönetici")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(index == 0 ? .black : .gray)
                    ZStack{
                        Capsule()    // yazıların altındaki çizgiler
                            .fill(Color.black.opacity(0.04))
                            .frame(height: 4)
                        
                        if index == 0 {
                            Capsule()
                                .fill(Color(red: 0.0, green: 0.0, blue: 0.6))
                                .frame(height: 4)
                                .matchedGeometryEffect(id: "Tab", in: name)
                        }
                    }

                }
                }
                Button(action: {
                    withAnimation(.spring()){
                        index = 1
                    }
                })
                {
                VStack{
                    Text("Personel")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(index == 1 ? .black : .gray)
                    ZStack{
                        Capsule()
                            .fill(Color.black.opacity(0.04))
                            .frame(height: 4)
                        
                        if index == 1 {
                            Capsule()
                                .fill(Color(red: 0.0, green: 0.0, blue: 0.6))
                                .frame(height: 4)
                                .matchedGeometryEffect(id: "Tab", in: name)
                        }
                    }

                }}
            }.padding(.top,30)
            
            if index == 0 {
                
                //Yönetici girişi
                YoneticiGiris()
            }
            else{
                PersonelGiris()
            }
            Spacer()
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Image(systemName: "chevron.left" )
            }
        }.navigationBarHidden(true)
        }
       
    }
}

struct YoneticiGiris : View {
    
    @State var user = " "
    @State var password = " "
    
    var body: some View{
        
        VStack{

            
            VStack(alignment: .leading, spacing: 15){
                Text("Kullanıcı adı")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .cornerRadius(5)
                TextField("email", text: $user)
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                Text("Şifre")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .cornerRadius(5)
                TextField("email", text: $password)
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
            }
            .padding(.horizontal,25)
            .padding(.top,25)

            
            NavigationLink(
                
                destination: mainPage()
                    .navigationBarBackButtonHidden(true),
                label: {
                    Text("Giriş Yap")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(Color(red: 0.0, green: 0.0, blue: 0.6))
                        .cornerRadius(8)
                }
            
            ).padding(.horizontal,25)
            .padding(.top,30)
            
            NavigationLink(
                
                destination: sifremiUnuttum()
                    .navigationBarBackButtonHidden(true),
                label: {
                    Text("Şifremi unuttum")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(2.0))
                }
            
            ).padding(.top, 10)
        }
        }
    }

struct PersonelGiris : View {
    
    @State var user = " "
    @State var password = " "
    
    var body: some View{
        
        VStack{

            
            VStack(alignment: .leading, spacing: 15){
                Text("Kullanıcı adı")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .cornerRadius(5)
                TextField("email", text: $user)
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                Text("Şifre")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .cornerRadius(5)
                TextField("email", text: $password)
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            // Button(action: {}){
            //Text("Giriş Yap")
             //       .foregroundColor(.white)
            //        .font(.system(size: 20))
            //        .fontWeight(.bold)
            //        .padding(.vertical)
            //        .frame(width: UIScreen.main.bounds.width - 50)
            //        .background(Color(red: 0.0, green: 0.0, blue: 0.6))
            //        .cornerRadius(8)
           // }
            //.padding(.horizontal,25)
            //.padding(.top,30)
            NavigationLink(
                
                destination: mainPage()
                    .navigationBarBackButtonHidden(true),
                label: {
                    Text("Giriş Yap")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(Color(red: 0.0, green: 0.0, blue: 0.6))
                        .cornerRadius(8)
                    
                }
            
            ).padding(.horizontal,25)
            .padding(.top,30)
            
           // Button(action: {}){
          //    Text("Şifremi unuttum")
           //         .font(.system(size: 14))
          //          .fontWeight(.bold)
          //          .foregroundColor(Color.gray.opacity(2.0))
          //  }
          //  .padding(.top, 10)
            
            NavigationLink(
                
                destination: sifremiUnuttum()
                    .navigationBarBackButtonHidden(true),
                label: {
                    Text("Şifremi unuttum")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray.opacity(2.0))
                }
            
            ).padding(.top, 10)
        }
    }
    }


struct Giris_Previews: PreviewProvider {
    static var previews: some View {
        Giris()
    }
}
