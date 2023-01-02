//
//  ContentView.swift
//  AccelerometerParallaxEffect
//
//  Created by Madalin Zaharia on 02.01.2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Drawing
    var body: some View {
        ZStack(alignment: .center) {
            Color.white
            
            photo
                .cornerRadius(32)
                .blur(radius: 5)
                .offset(y: 12)
                .opacity(0.9)
                .frame(width: UIScreen.main.bounds.width - 80)
                .overlay(
                    photo
                        .cornerRadius(12)
                        .parallaxMotion(magnitude: 30)
                )
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private var photo: some View {
        Image("the_rainbow_and_God's_covenant_with_man")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
