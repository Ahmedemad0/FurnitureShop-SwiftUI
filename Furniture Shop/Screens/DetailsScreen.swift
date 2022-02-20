//
//  DetailsScreen.swift
//  Furniture Shop
//
//  Created by ahmed on 19/02/2022.
//

import SwiftUI

struct DetailsScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg").ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
              Image("chair_1")
                    .resizable()
                    .aspectRatio(1,contentMode: .fit)
                    DescriptionView()
            }
            .edgesIgnoringSafeArea(.top)
            BottomTabBarView()
        }
       
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
        
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Luxury Sweida \nChair")
                .fontWeight(.bold)
                .font(.title)
            
            HStack {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Text("243")
                    .opacity(0.5)
                    .padding(.leading , 8)
                Spacer()
            }
            
            HStack {
                Text("Description")
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                Text("Review")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding(.leading, 4)
            }
            
            .padding(.bottom , 2)
            
            Text("Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical Luxury Swedian Chair is a contemporary chair based on the virtues of modern craft. it carries on the simplicity and honestly of the archetypical chair .")
                .opacity(0.7)
                .lineSpacing(6)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.bottom , 4)
                    Text("Height: 160 Cm")
                        .opacity(0.7)
                        
                    Text("Wide: 80 Cm")
                        .opacity(0.7)
                        .padding(.top , 1)
                    Text("Diameter: 67 cm")
                        .opacity(0.7)
                        .padding(.top , 1)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack {
                    Text("Treatment")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                        
                    Text("Jati wood, Canvas")
                        .opacity(0.7)
                    Text("Amazing love")
                        .opacity(0.7)
                        .padding(.top , 1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 8)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Colors")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                
                
                    HStack {
                        CircleColorView(color: .white)
                        CircleColorView(color: .black)
                        CircleColorView(color: Color("Primary"))
                    }
                }
                .frame(maxWidth: .infinity , alignment: .leading)
                VStack(alignment: .leading) {
                    Text("Quantity")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                    
                    HStack() {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .frame(width: 30, height: 30)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                .foregroundColor(Color.black)
                                .padding(.all, 8)
                        }
                        
                        Text("1")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .padding(.all, 8)
                                .background(Color("Primary"))
                                .clipShape(Circle())
                        }
                    }

                }
                .padding(.bottom , 20)
                .frame(maxWidth: .infinity , alignment: .leading)
            }
            .padding(.top , 8)
        }
        .padding()
        .padding(.top, 8)
        .padding(.leading, 8)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft , .topRight])
        .offset(x: 0, y: -30)
    }
}

struct CircleColorView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}


struct BottomTabBarView: View {
    var body: some View {
        HStack {
            Text("$ 124")
                .font(.title)
                .foregroundColor(.white)
            Spacer()
            
            Button(action: {}) {
                Text("Add to Cart")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .padding(.horizontal)
        .background(Color("Primary"))
        .cornerRadius(60.0, corners: .topLeft)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
    }
}
