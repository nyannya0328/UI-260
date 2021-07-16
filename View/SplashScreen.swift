//
//  SplashScreen.swift
//  UI-260
//
//  Created by nyannyan0328 on 2021/07/15.
//

import SwiftUI

struct SplashScreen<Content : View,TitleView : View,LogoView : View,NavButton : View>: View {
    
    var content : Content
    var titleView : TitleView
    var logoView : LogoView
    var imageSize : CGSize
    var navButton : NavButton
    
    
    init( imageSize : CGSize, @ViewBuilder content : @escaping()->Content,@ViewBuilder titleView : @escaping()->TitleView,@ViewBuilder logoView : @escaping()->LogoView,@ViewBuilder navButton : @escaping()->NavButton){
        
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.imageSize = imageSize
        self.navButton = navButton()
        
        
        
        
    }
    
    @State var titleAnimation = false
    
    @State var EndAnimation = false
    
    @State var showNAV = false
    
    @Namespace var animation
    
    var body: some View {
        
        
        VStack(spacing:0){
            
            
            ZStack{
                
                Color("c1")
                    .background(Color("c1"))
                
                
                titleView
                    .scaleEffect(EndAnimation ? 0.8 : 1)
                    .offset(y: titleAnimation ? -5 : 150)
                
                if !EndAnimation{
                    
                    logoView
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: imageSize.width, height: imageSize.height)
                }
                
              
                    
                    
                    
                    HStack{
                        
                        navButton
                            .opacity(showNAV ? 1 : 0)
                            .padding(.bottom,5)
                            
                           
                        
                        Spacer()
                        
                        if EndAnimation{
                        
                        logoView
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(width: 50, height: 50)
                          
                            .offset(y: -5)
                          
                           
                            
                        
                    }
                }
                    .padding(.horizontal)
                
                
            }
            .frame(height: EndAnimation ? 60 : nil)
            .zIndex(1)
            
            content
                .frame(height: EndAnimation ? nil : 0)
               
            .zIndex(0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                
                withAnimation(.linear){
                    
                    
                    titleAnimation.toggle()
                }
                
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)){
                    
                    
                    EndAnimation.toggle()
                    
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                    
                    withAnimation{
                        
                        showNAV.toggle()
                    }
                }
                
                
            }
        }
    }
        
        
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
