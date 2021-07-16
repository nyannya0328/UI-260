//
//  Emitter.swift
//  UI-260
//
//  Created by nyannyan0328 on 2021/07/15.
//

import SwiftUI

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct Emitter: View {
    @State var wish = false
    @State var finish = false
    var body: some View {
        ZStack {
            VStack{
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                
                Text("Happy Birthday!")
                    .font(.custom("Limelight-Regular", size: 30))
                    .foregroundColor(.orange)
                
                
                Text("Tiger")
                    .font(.custom("Limelight-Regular", size: 30))
                    .foregroundColor(.primary)
                    .shadow(color: .white.opacity(0.3), radius: 5, x: 5, y: 5)
                    .padding(.top,10)
                
                
                Button {
                    
                    doAnimation()
                    
                } label: {
                    
                    Text("WISH")
                        .font(.custom("Limelight-Regular", size: 30))
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        
                    
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .controlProminence(.increased)
                .disabled(wish)

            
                   
                 
              
            }
            
            EmitterView()
                .scaleEffect(wish && !finish ? 1 : 0,anchor: .top)
                .opacity(wish ? 1 : 0)
                .offset(y: wish ? 0 : getRect().height / 2)
                .ignoresSafeArea()
        }
       
    }
    func doAnimation(){
        
        
        withAnimation(.spring()){
            
            wish = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            
            
            withAnimation(.easeInOut){
                
                
                finish = true
            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
                    
                    
                    wish = false
                    finish = false
                
            }
        }
     
        
    }
}

struct Emitter_Previews: PreviewProvider {
    static var previews: some View {
        Emitter()
    }
}


struct EmitterView : UIViewRepresentable{
    
    let view = UIView()
    let emmiterLayer = CAEmitterLayer()
    
    func makeUIView(context: Context) -> UIView {
        
        view.backgroundColor = .clear
        
        emmiterLayer.emitterShape = .line
        
        emmiterLayer.emitterCells = CrateEmmiterCell()
        emmiterLayer.emitterSize = CGSize(width: getRect().width, height: 1)
        emmiterLayer.emitterPosition = CGPoint(x: getRect().width / 2, y: 0)
        
        
        view.layer.addSublayer(emmiterLayer)
        
        
        
        return view
        
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    func CrateEmmiterCell()->[CAEmitterCell]{
        
        var emitercells : [CAEmitterCell] = []
        
        
        for index in 1...15{
            
            let cell = CAEmitterCell()
            cell.contents =  UIImage(named: getImageIndex(index: index))?.cgImage
            cell.color = getColor().cgColor
            cell.birthRate = 5
          
            
           
            cell.scale = 0.5
            
            
            cell.lifetime = 10
            cell.velocity = 200
            
            cell.emissionLongitude = .pi
            cell.emissionRange = 1
            cell.spin = 5
            cell.yAcceleration = 1
            cell.spinRange = 1
            cell.xAcceleration = 5
            cell.scaleSpeed = 0.1
           
            emitercells.append(cell)
        }
        
      
        
        return emitercells
        
       
        
        
        
        
        
        
        
    }
    
    func getImageIndex(index : Int) -> String{
        
        
        if index < 4{
            
            return "circle"
        }
        
        else if index < 5 && index <= 8 {
            
            
            return "rectangle"
        }
        else{
            
            return "triangle"
        }
        
        
        
    }
    
    
    func getColor()->UIColor{
        
        
        let colos : [UIColor] = [
            
            .systemRed,.systemBlue,.systemPink,.red,.orange
            
        
        ]
        
        return colos.randomElement()!
    }
    
    
    
    
    
    
}
