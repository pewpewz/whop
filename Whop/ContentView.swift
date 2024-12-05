//
//  ContentView.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import SwiftUI


struct ContentView: View {

    
    @State var numbers = Array(0...20)
    @State var isFinished:Bool = false
    @State var isLoading:Bool = false

    var body: some View {

        // Sub-menu items
        let subMenuItems = [ MenuItem(name: "Swift"),
                                 MenuItem(name: "Vulcano"),
                                 MenuItem(name: "Swift Mini"),
                                 MenuItem(name: "Lux D")
                                ]
        
        // Main menu items
        let sampleMenuItems = [
                                MenuItem(name: "Menu", subMenuItems: subMenuItems),
                                MenuItem(name: "Web Cell Link"),
                            ]
        
        NavigationStack {
            List(sampleMenuItems, children: \.subMenuItems) { item in
                Text(item.name)
                    .font(.system(.title3, design: .rounded))
                    .bold()
            }
            
//            List {
//                ForEach(numbers, id: \.self) { number in
//                    TextView(color: .green, text: "Even: \(number)")
//                }
//                
//                if !isFinished {
//                    ProgressView()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        .foregroundColor(.blue)
//                        .foregroundColor(.yellow)
//                        .onAppear() {
//                            loadMore()
//                        }
//                }
//            }
            .navigationTitle("Whop Infinite Scroll")
        }
    }
    
    func loadMore() {
        
        if !isLoading {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                numbers.append(contentsOf:numbers.count + 1...numbers.count + 20)
                
                isLoading = false
                if numbers.count > 250 {
                    isFinished = true
                }
            }
        }
        
    }
}
//
//#Preview {
//    ContentView()
//}
