//
//  welcomePage.swift
//  aa
//
//  Created by depo on 9.07.2024.
//

import SwiftUI

struct welcomePage: View {
    var body: some View {
        NavigationView{
       
        VStack{

            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 270, height: 270)
                .padding()
                
            
          
            Text("\"Değişen Dünyanın Habercisi\"")
                .font(.system(size: 22, weight: .regular, design: .serif))
                .italic()
                .padding()
                .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.6))
   
          Spacer()
          Spacer()
            NavigationLink(
                
                destination: Giris()
                    .navigationBarBackButtonHidden(true),
                label: {
                    Text("Giriş")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(Color(red: 0.0, green: 0.0, blue: 0.6))
                        .cornerRadius(8)
                }
               
                
                
            
            )
            .navigationBarBackButtonHidden(true)
            NavigationLink(
                
                destination: hesapOlustur()
                    .navigationBarBackButtonHidden(true),
                label: {
                    Text("Hesap oluştur")
                        
                        .font(.system(size: 18))
                        
                        .fontWeight(.regular)
                        
                        .foregroundColor(Color.gray.opacity(2.0))
                        
                        .padding(.horizontal) // Yatayda ekstra boşluk
                }
            
            )
            Spacer()
                
        
        }
       
        }
        
    }
}

struct welcomePage_Previews: PreviewProvider {
    static var previews: some View {
        welcomePage()
    }
}
