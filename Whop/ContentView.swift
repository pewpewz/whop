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
        NavigationStack {
            List {
                ForEach(numbers, id: \.self) { number in
                    TextView(color: .green, text: "Even: \(number)")
//                    Text("number :\(number)")
                }
                
                if !isFinished {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.blue)
                        .foregroundColor(.yellow)
                        .onAppear() {
                            loadMore()
                        }
                }
            }
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