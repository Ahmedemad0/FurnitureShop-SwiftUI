//
//  HomeScreen.swift
//  Furniture Shop
//
//  Created by ahmed on 18/02/2022.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Chair", "Table", "Kitchen", "Lamp", "Bed", "Chair", "Table", "Kitchen"]
    
    private let cardImage = ["chair_1","chair_2", "chair_3", "chair_4"]
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg").ignoresSafeArea(.all)
                
                ScrollView {
                    VStack(alignment: .leading){
                        TabBarView()
                        
                        TitleView()
                            .padding()
                        
                        SearchView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categories.count) { item in
                                    CategoriesView(isActive: item == selectedIndex, text: categories[item])
                                        .onTapGesture {
                                            selectedIndex = item
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .fontWeight(.bold)
                            .font(.system(size: 28))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< cardImage.count) { item in
                                    NavigationLink(destination: DetailsScreen()) {
                                        ProductCellView(image: Image(cardImage[item]), size: 210)
                                    }
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        Text("Best")
                            .fontWeight(.bold)
                            .font(.system(size: 28))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< cardImage.count) { item in
                                    ProductCellView(image: Image(cardImage[item]), size: 180)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        .padding(.bottom, 100)
                    }
                }
                
                // Nav Bar
                
                HStack {
                    
                    NavBarItem(image: Image("Home")){}
                    NavBarItem(image: Image("fav")){}
                    NavBarItem(image: Image("cart")){}
                    NavBarItem(image: Image("User")){}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.2), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity , alignment: .bottom)
            }
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct TabBarView: View {
    var body: some View {
        HStack {
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10.0)
            }
            Spacer()
            Image("Profile")
                .resizable()
                .frame(width: 48, height: 48)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

struct TitleView: View {
    var body: some View {
        
        Text("Find The \nBest ")
            .fontWeight(.regular)
            .font(.system(size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .fontWeight(.bold)
            .font(.system(size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchView: View {
    @State private var searchText: String = ""
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search furniture", text: $searchText)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoriesView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.6))
            if isActive {
                Color("Primary")
                    .frame(width: 30, height: 2)
                    .clipShape(Capsule())
            }

        }
        .padding(.trailing)
    }
}

struct ProductCellView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20)
            Text("Luxory chair")
                .fontWeight(.bold)
                .font(.title3)
            
            HStack(spacing: 2){
                ForEach(0..<5){ item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$ 320")
                    .fontWeight(.bold)
                    .font(.title3)
            }
        }
        .frame(width: 210)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct NavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label:{
            image
                .frame(maxWidth: .infinity)
        })
    }
}
