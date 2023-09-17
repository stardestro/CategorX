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

struct item: Codable {
    let image: Int
    let category: String
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
    
    @State var category = String("STARTUP")
    
    @State private var index = 5
    
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
                        .zIndex(99)
                        .opacity(0.000001)
                        .cornerRadius(10)
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
                                print(endpoint)
                                withAnimation(.spring(response: (button == 0) ? 0 : 0.5)) {
                                    scale = 1.0
                                }
                                if(button == 1){
                                    category = "Paper"
                                    
                                    // paper
                                }
                                if(button == 2){
                                    category = "Glass"
                                }
                                if(button == 3){
                                    category = "Other"
                                    //other
                                }
                                if(button == 4){
                                    
                                    category = "Metal"
                                }
                                spring = 0
                                Task(priority: .userInitiated) {
                                   _ = await placeOrder(ID: index, Category: category)
                                }
                                
                                if(button != 0){
                                    index = Int.random(in: 1..<177)
                                }
                                button = -1
                                AudioServicesPlaySystemSound(SoundNumber)
                                SoundNumber = 1163
                                
                            })
                            
                    )
                        .task{
                                await placeOrder(ID: index, Category: category)
                        }
                    
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
//                            .foregroundColor(.accentColor)
                        //                        .cornerRadius(10)
                        //                        .shadow(radius: 10)
                        //                        .padding(10)
                        
                        Spacer()
                        
                        Spacer(minLength: 0)
                        
                        Spacer()
                        //                    Text("🗞️🥫🫙🗑️ \n  Paper Cans ")
                        //                        .font(.system(size: 40))
                        
                    }
                    
                    
                    
                    
                    
                    
                }.padding(10)
                    .scaleEffect(scale)
                Text("Long Press to Classify")
                    .font(.system(size: 30))
            }
            ZStack{
                Circle()
                    .fill(Color(UIColor.systemYellow))
                    .frame(width: 75, height: 75)
                
                Text("🗞️")
                    .font(.system(size: 40))
                    .frame(width: 150, height: 150)
            }
            .position(x:(startpoint.x), y: (startpoint.y + 100))
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
            .position(x:(startpoint.x), y: (startpoint.y + 100))
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
            .position(x:(startpoint.x), y: (startpoint.y + 100))
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
            .position(x:(startpoint.x), y: (startpoint.y + 100))
            .offset(x: offsetpoint3.x, y: offsetpoint3.y)
            .opacity(isDragged ? 0.7: 0)
            .cornerRadius(10)
            .opacity(isDragged ? 1: 0)
            .scaleEffect((button == 2) ? 1.2 : 1)
        }
    }
}


func placeOrder(ID: Int, Category: String) async {
    guard let url =  URL(string:"http://127.0.0.1:8090/api/collections/Images_demo/records")
            else{
                return
            }

            //### This is a little bit simplified. You may need to escape `username` and `password` when they can contain some special characters...
//            let body = "category=1"
//            let finalBody = body.data(using: .utf8)
            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
            let body = item(image: ID, category: Category)
            let finalBody = try? encoder.encode(body)
//            catch{
//                print(finalBody)
//            }
//            print("\(finalBody)")
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalBody
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            URLSession.shared.dataTask(with: request){
                (data, response, error) in
                print(response as Any)
                if let error = error {
                    print(error)
                    return
                }
                guard let data = data else{
                    return
                }
                print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")

            }.resume()

}

