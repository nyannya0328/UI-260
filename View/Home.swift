//
//  Home.swift
//  UI-260
//
//  Created by nyannyan0328 on 2021/07/15.
//

import SwiftUI

struct Home: View {
    @Namespace var animation
    @State var selected = "All Photos"
    var body: some View {
        VStack(spacing:0){
            
            
            HStack(spacing:0){
                
                ForEach(["All Photos","Chat","Statas"],id:\.self){index in
                    
                    
                    TabButton(title: index, selected: $selected, animation: animation)
                    
                    
                }
                
                
            }
            .padding(.top,10)
            .background(Color("c1").opacity(0.3))
            
            
            switch selected {
            case "All Photos " : All()
        case "Chat":Emitter()
            case "Statas" : ContentView()
     
        default: All()
         
        }
            
           
           
           
            
        }
        .background(.quaternary)
      
        
       
      
       
        
      
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabButton : View{
    
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        
        Button {
            withAnimation{
                
                selected = title
            }
        } label: {
            
         
            VStack{
          
                
                Text(title)
                    .font(.title3)
                    .foregroundColor(selected == title ? .primary : .gray)
                
                ZStack{
                    
                    if selected == title{
                        
                        Capsule()
                            .fill(Color.orange)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .frame(height: 3.5)

                        
                        
                        
                    }
                    
                    else{
                        
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 3.5)

                        
                        
                    }
                }
            
                
            }
            .frame(maxWidth: .infinity)
      
        }
     

    }
}

struct All : View{
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            
            
            
            ForEach(1...6,id:\.self){index in
                
                
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 270)
                    .cornerRadius(15)
                   
                
            }
            .padding()
            
            
        }
        
        
    }
}
