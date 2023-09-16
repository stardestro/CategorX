//
//  ContentView.swift
//  CategorX
//
//  Created by Hussain Alkatheri on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            VStack {
                Text("CategorX")
                    .font(.system(size: 30))
                    .padding(.top)
                CardView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    @State private var isDragged = false
    @State private var test = false
    
    @State var startpoint = CGPoint(x: 0, y: 0)
    
    @State var offsetpoint = CGPoint(x: 0, y: 0)

    
    var body: some View {
        ZStack{
            
                
            Rectangle()
                .fill(Color(UIColor.systemGray4))
                .cornerRadius(10)
                
            // Background
            Text("LOADING...")
                .scaledToFit()
                .font(.system(size: 25))
//            GeometryReader { geometry in
                
                Image("glass2")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .cornerRadius(10)
                    .padding(5)
                    .gesture(DragGesture(minimumDistance: 10)
                        .onChanged({ value in
//                            offsetpoint = CGPoint(x: 100, y: 0)
//                            startpoint = value.startLocation
                            startpoint = CGPoint(x: value.startLocation.x, y: value.startLocation.y + 100)
                            withAnimation() {
                                offsetpoint = CGPoint(x: 150, y: 0)
                            }
                            isDragged = true
//                            print(value.self)
                        })
                        .onEnded({ _ in
                            offsetpoint = CGPoint(x: 0, y: 0)
                            isDragged = false
                        })
                    
                    )
//            }
//            if(isDragged){
//
//            }
                Circle()
                    .fill(Color(UIColor.systemRed))
                    .frame(width: 100, height: 100)
                    .position(startpoint)
//                    .transformEffect(isDragged)
                    .offset(x:offsetpoint.x)
//                    .animation(.linear, value: offsetpoint.x > 10)
                    .opacity(isDragged ? 0.7: 0)
                    .cornerRadius(10)
                    .opacity(isDragged ? 1: 0)
                    
                    
//            }

            }.padding(10)
        
        
    }
}
