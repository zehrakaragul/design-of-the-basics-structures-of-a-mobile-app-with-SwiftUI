//
//  mainPage.swift
//  aa
//
//  Created by depo on 10.07.2024.
//

import SwiftUI

struct mainPage: View {
    @State private var showMenu = false
    @State private var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        
        TabView {
            Feed()
                .tabItem {
                    Image(systemName: "house")
                        
                }

            UploadPhoto()
                .tabItem {
                    Image(systemName: "plus.square.fill")
                       
                }

            Profil()
                .tabItem {
                    Image(systemName: "person.fill")
                    
                }
        }
        .ignoresSafeArea(.all)
    }
}

struct Feed: View {
    var body: some View {
        Text("Ana Sayfa")
            .navigationBarHidden(true)
    }
}

struct UploadPhoto: View {
    
    var body: some View {
        Text("Ekle")
            .navigationBarHidden(true)
    }
}

struct Profil: View {
    
    @State private var showMenu = false
    @State private var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        NavigationView{
            ZStack {
                // Content view based on selectedOption
                if let option = selectedOption {
                    option.destination
                } else {
                    Text("Profil")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                
                // Side menu
                SideMenu(isShowing: $showMenu, selectedOption: $selectedOption)
                    .zIndex(1) // Ensure SideMenu is on top
            }
            .navigationBarHidden(showMenu) // Hide navigation bar when side menu is visible
            .edgesIgnoringSafeArea(.all)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3")
                            
                    }
                }
            }
        }
    }
}

struct SideMenu: View {
    @Binding var isShowing: Bool
    @Binding var selectedOption: SideMenuOptionModel?
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing.toggle()
                        }
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        // SideMenuHeader
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .imageScale(.large)
                                .foregroundColor(.white)
                                .frame(width: 48, height: 48)
                                .background(Color.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.vertical)
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Stephan Dowless")
                                    .font(.subheadline)
                                Text("test@gmail.com")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.top)
                        
                        // Side menu options
                        VStack {
                            ForEach(SideMenuOptionModel.allCases) { option in
                                Button(action: {
                                    onOptionTapped(option)
                                }) {
                                    SideMenuRowView(option: option, selectedOption: $selectedOption)
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color.white)
                    Spacer()
                }
                .transition(.move(edge: .leading))
                .zIndex(2) // Ensure SideMenu is on top
            }
        }
        .animation(.easeInOut, value: isShowing)
    }
    
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
        isShowing = false
    }
}


struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    private var isSelected:Bool {
        return selectedOption == option
    }
    
    var body: some View{
        HStack{
            Image(systemName: option.systemImageName)
                .imageScale(.medium)
            Text(option.title)
                .font(.subheadline)
            Spacer()
        }
        .padding(.leading)
        .foregroundColor(isSelected ? Color.blue : .primary)
        .frame(width:216, height: 44)
        .background(isSelected ? Color.gray.opacity(0.15): .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}


struct mainPage_Previews: PreviewProvider {
    static var previews: some View {
        mainPage()
    }
}
