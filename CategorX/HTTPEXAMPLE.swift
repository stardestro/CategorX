////
////  ContentView.swift
////  post test
////
////  Created by Hussain Alkatheri on 9/17/23.
////
//
//import SwiftUI
//
//struct item: Codable {
//    let image: Int
//    let category: String
//}
//
//struct ContentView: View {
//    
//    @State private var confirmationMessage = ""
//    @State private var showingConfirmation = false
//    
////    @State var testing = Todo(id: 1, category: "Metal")
//    
//    var body: some View {
//        VStack {
//            Button("Place Order") {
//                Task {
//                    await placeOrder()
//                }
//            }.alert("Thank you!", isPresented: $showingConfirmation) {
//                Button("OK") { }
//            } message: {
//                Text(confirmationMessage)
//            }
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//func placeOrder() async {
//    guard let url =  URL(string:"http://127.0.0.1:8090/api/collections/Images/records")
//            else{
//                return
//            }
//            
//            //### This is a little bit simplified. You may need to escape `username` and `password` when they can contain some special characters...
////            let body = "category=1"
////            let finalBody = body.data(using: .utf8)
//            let encoder = JSONEncoder()
////            encoder.outputFormatting = .prettyPrinted
//            let body = item(image: 7, category: "Paper")
//            let finalBody = try? encoder.encode(body)
////            catch{
////                print(finalBody)
////            }
////            print("\(finalBody)")
//            var request = URLRequest(url: url)
//            request.httpMethod = "POST"
//            request.httpBody = finalBody
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.addValue("application/json", forHTTPHeaderField: "Accept")
//            
//            URLSession.shared.dataTask(with: request){
//                (data, response, error) in
////                print(response as Any)
//                if let error = error {
//                    print(error)
//                    return
//                }
//                guard let data = data else{
//                    return
//                }
//                print(data, String(data: data, encoding: .utf8) ?? "*unknown encoding*")
//                
//            }.resume()
//    
//}
//
