//
//  ContentView.swift
//  UI-260
//
//  Created by nyannyan0328 on 2021/07/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen(imageSize: CGSize(width: 128, height: 128)) {
            Home()
            
        } titleView: {
            
            Text("Chatty")
                .font(.title.bold())
                .foregroundColor(.white)
            
        } logoView: {
            
           Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            
        } navButton: {
            
            
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Capsule())
                .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(
                    
                    LinearGradient(colors: [
                        
                        .blue.opacity(0.3)
                    
                    
                    
                    ] + Array(repeating: .red.opacity(0.1), count: 20), startPoint: .center, endPoint: .leading),lineWidth: 3
                    
                    )
                
                )
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
