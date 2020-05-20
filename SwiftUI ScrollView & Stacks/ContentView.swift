//
//  ContentView.swift
//  SwiftUI ScrollView & Stacks
//
//  Created by mohamed  habib on 20/05/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            ScrollView(.horizontal, showsIndicators: false) {
                   HStack{
                       ForEach(Book.demoBooks) { book in
                           GeometryReader{ proxy in
                               VStack {
                                   
                                   Text(book.title)
                                       .fontWeight(.bold)
                                       .font(Font.system(.headline, design: .rounded))
                                       .minimumScaleFactor(0.75)
                                       .foregroundColor(.white)
                                       .padding([.leading, .top, .trailing])
                                       .multilineTextAlignment(.center)
                                   
                                   Image(book.imageName)
                                       .resizable()
                                       .scaledToFit()
                                       .shadow(color: .gray, radius: 10)
                                   
                                   // .frame(width: 100, height: 100)
                                   // .padding()
                               }
                                   
                                   //  .frame(width: proxy.size.width, height: 300)
                                   .frame(width: min(proxy.size.width + proxy.frame(in: .global).midX, proxy.size.width), height: proxy.size.width - 50 )
                                   .background(
                                       Image(book.imageName)
                                           .resizable()
                                           .scaledToFill()
                                           .overlay(Color.myGreen)
                                           .blendMode(.multiply)
                                       .blur(radius: 1)
                               )
                                   .cornerRadius(10)
                                   .padding()
                                   .shadow(radius: 3)
                                   .layoutPriority(1)
                                   .rotation3DEffect(Angle(degrees: Double(proxy.frame(in: .global).midX ) / 40), axis: (x: -4, y: -3, z: -3))
                               
                           }
                           .frame(width: 200, height: 300)
                       }
                   }
               }
           Spacer()
            .layoutPriority(1)
            
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
        // Scroll vertical
        
        //               ScrollView(.vertical, showsIndicators: false) {
        //                   VStack{
        //                       ForEach(Book.demoBooks) { book in
        //                           VStack {
        //                               Text(book.title)
        //                                   .padding([.leading, .top, .trailing])
        //                                   .multilineTextAlignment(.center)
        //                               Image(book.imageName)
        //                               .resizable()
        //                               .scaledToFit()
        //                              // .frame(width: 100, height: 100)
        //                               .padding()
        //                           }
        //                       .frame(width: 150, height: 150)
        //                           .background(Color.white)
        //                       .cornerRadius(10)
        //                       .padding()
        //                       .shadow(radius: 3)
        //
        //                       }
        //                   }
        //               }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone Xs")
    }
}
#endif

extension Color {
    static let myGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}
