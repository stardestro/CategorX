//
//  ContentView.swift
//  CategorX
//
//  Created by Hussain Alkatheri on 9/16/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    var body: some View {
        HStack{
            VStack {
//                Text("CategorX")
//                    .font(.system(size: 30))
//                    .padding(.top)
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
    
    private let colors: [Int32] = [1 , 2, 3, 4, 5, 6]
    
    @State var startpoint = CGPoint(x: 0, y: 0)
    @State var endpoint = CGPoint(x: 0, y: 0)
    
    @State private var button = 0
    
    @State private var scale = 1.0
    
    @State private var spring = 0.0
    
    @State var offsetpoint = CGPoint(x: 0, y: 0)
    @State var offsetpoint1 = CGPoint(x: 0, y: 0)
    @State var offsetpoint2 = CGPoint(x: 0, y: 0)
    @State var offsetpoint3 = CGPoint(x: 0, y: 0)
    @State var offsetpoint4 = CGPoint(x: 0, y: 0)
    @State var offsetpoint5 = CGPoint(x: 0, y: 0)
    
//    @State private var names = ["glass2", "cardboard3"]
    
    @State private var index = 1
    
    @State private var SoundNumber: SystemSoundID = 1163
    
    
    var body: some View {
        ZStack{
            ZStack{
                Circle()
                    .fill(Color(UIColor.systemBlue))
                    .frame(width: 800)
                    .opacity(0.7)
                    .position(x: 215, y: -275)
                    
                Circle()
                    .fill(Color(UIColor.systemRed))
                    .frame(width: 600)
                    .opacity(0.7)
                    .position(x: -100, y: 400)
                Circle()
                    .fill(Color(UIColor.systemYellow))
                    .frame(width: 600)
                    .opacity(0.7)
                    .position(x: 550, y: 400)
                Circle()
                    .fill(Color(UIColor.systemGray))
                    .frame(width: 400)
                    .opacity(0.7)
                    .position(x: 215, y: 900)
                
            }
            VStack{
                Text("CategorX")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .zIndex(100)
                
                ZStack{
                    
                    
                    
                    Rectangle()
                        .fill(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 10)
                    
                    // Background
                    Text("LOADING...")
                        .scaledToFit()
                        .font(.system(size: 25))
                    //            GeometryReader { geometry in
                    VStack(){
                        Spacer()
                        HStack{
                            Spacer()
                            VStack{
                                Text("🗞️")
                                    .font(.system(size: 50))
                                Text("Paper")
                                    .font(.system(size: 25))
                            }
                            Spacer()
                            VStack{
                                Text("🥫")
                                    .font(.system(size: 50))
                                Text("Metal")
                                
                                    .font(.system(size: 25))
                            }
                            Spacer()
                            VStack{
                                Text("🫙")
                                    .font(.system(size: 50))
                                Text("Glass")
                                    .font(.system(size: 25))
                            }
                            Spacer()
                            VStack{
                                Text("🗑️")
                                    .font(.system(size: 50))
                                Text("Other")
                                    .font(.system(size: 25))
                            }
                            Spacer()
                        }
                        
                        Spacer()
                        Image("image"+String(index))
                            .resizable()
                            .scaledToFit()
                        //                        .padding(10)
                            .foregroundColor(.accentColor)
                        //                        .cornerRadius(10)
                        //                        .shadow(radius: 10)
                        //                        .padding(10)
                        
                        Spacer()
                        
                        Spacer(minLength: 0)
                        
                        Spacer()
                        //                    Text("🗞️🥫🫙🗑️ \n  Paper Cans ")
                        //                        .font(.system(size: 40))
                        
                    }
                    .gesture(DragGesture(minimumDistance: 0)
                        .onChanged({ value in
                            startpoint = CGPoint(x: value.startLocation.x, y: value.startLocation.y)
                            withAnimation(.spring(response: scale)) {
                                offsetpoint = CGPoint(x: 150, y: 0)
                                offsetpoint1 = CGPoint(x: 0, y: 150)
                                offsetpoint2 = CGPoint(x: -150, y: 0)
                                offsetpoint3 = CGPoint(x: 0, y: -150)
                                scale = 0.97
                            }
                            isDragged = true
                            endpoint = CGPoint(x: (value.location.x-value.startLocation.x), y: (value.location.y-value.startLocation.y))
                            //                            print(endpoint)
                            if(endpoint.x > 60){
                                button = 1
                                SoundNumber = 1342
                                spring = 0.5
                                
                            }
                            else if(endpoint.x < -60){
                                button = 4
                                SoundNumber = 1342
                                spring = 0.5
                                
                            }
                            else if(endpoint.y > 90){
                                button = 3
                                SoundNumber = 1342
                                spring = 0.5
                                
                            }
                            else if(endpoint.y < -30){
                                button = 2
                                SoundNumber = 1342
                                spring = 0.5
                                
                            }
                            else{
                                button = 0
                                SoundNumber = 1163
                                spring = 0.0
                            }
                            
                        })
                            .onEnded({ value in
                                offsetpoint = CGPoint(x: 0, y: 0)
                                offsetpoint1 = CGPoint(x: 0, y: 0)
                                offsetpoint2 = CGPoint(x: 0, y: 0)
                                offsetpoint3 = CGPoint(x: 0, y: 0)
                                offsetpoint4 = CGPoint(x: 0, y: 0)
                                offsetpoint5 = CGPoint(x: 0, y: 0)
                                isDragged = false
                                endpoint = CGPoint(x: value.location.x-value.startLocation.x, y: value.location.y - value.startLocation.y)
                                withAnimation(.spring(response: (button == 0) ? 0 : 0.5)) {
                                    scale = 1.0
                                }
                                spring = 0
                                if(button != 0){
                                    index = Int.random(in: 1..<177)
                                }
                                button = -1
                                AudioServicesPlaySystemSound(SoundNumber)
                                SoundNumber = 1163
                                
                            })
                             
                    )
                    
                    ZStack{
                        Circle()
                            .fill(Color(UIColor.systemYellow))
                            .frame(width: 75, height: 75)
                        
                        Text("🗞️")
                            .font(.system(size: 40))
                            .frame(width: 150, height: 150)
                    }
                    .position(startpoint)
                    .offset(x: offsetpoint.x, y: offsetpoint.y)
                    .opacity(isDragged ? 0.7: 0)
                    .cornerRadius(10)
                    .opacity(isDragged ? 1: 1)
                    .scaleEffect((button == 1) ? 1.2 : 1)
                    
                    ZStack{
                        Circle()
                            .fill(Color(UIColor.systemGray2))
                            .frame(width: 75, height: 75)
                        
                        Text("🗑️")
                            .font(.system(size: 40))
                            .frame(width: 150, height: 150)
                    }
                    //                .fill(Color(UIColor.systemRed))
                    .frame(width: 75, height: 75)
                    .position(startpoint)
                    .offset(x: offsetpoint1.x, y: offsetpoint1.y)
                    .opacity(isDragged ? 0.7: 0)
                    .cornerRadius(10)
                    .opacity(isDragged ? 1: 3)
                    .scaleEffect((button == 3) ? 1.2 : 1)
                    
                    ZStack{
                        Circle()
                            .fill(Color(UIColor.systemRed))
                            .frame(width: 75, height: 75)
                        
                        Text("🥫")
                            .font(.system(size: 40))
                            .frame(width: 150, height: 150)
                    }
                    //                .fill(Color(UIColor.systemRed))
                    .frame(width: 75, height: 75)
                    .position(startpoint)
                    .offset(x: offsetpoint2.x, y: offsetpoint2.y)
                    .opacity(isDragged ? 0.7: 0)
                    .cornerRadius(10)
                    .opacity(isDragged ? 1: 0)
                    .scaleEffect((button == 4) ? 1.2 : 1)
                    
                    ZStack{
                        Circle()
                            .fill(Color(UIColor.systemBlue))
                            .frame(width: 75, height: 75)
                        
                        Text("🫙")
                            .font(.system(size: 40))
                            .frame(width: 150, height: 150)
                    }
                    .frame(width: 75, height: 75)
                    .position(startpoint)
                    .offset(x: offsetpoint3.x, y: offsetpoint3.y)
                    .opacity(isDragged ? 0.7: 0)
                    .cornerRadius(10)
                    .opacity(isDragged ? 1: 0)
                    .scaleEffect((button == 2) ? 1.2 : 1)
                    
                    
                    
                }.padding(10)
                    .scaleEffect(scale)
                Text("Long Press to Classify")
                    .font(.system(size: 30))
            }
        }
    }
}
