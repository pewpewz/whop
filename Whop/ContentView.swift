//
//  ContentView.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import SwiftUI

let subMenuItemsMock:[MenuItem] = [.init(name: "More Cells"),
                                .init(name: "More Cells"),
                                .init(name: "More Cells"),
                                .init(name: "More Cells"),
                                .init(name: "More Cells")]


struct ContentView: View {
    
    @State var isLoading:Bool = false
    
    @State var isSetupFinished:Bool = false

    @State var subMenuItems: [MenuItem] = subMenuItemsMock
    
    @State var sampleMenuItems: [MenuItem] = []

    var body: some View {
        
        NavigationStack {
            List(sampleMenuItems, children: \.subMenuItems) { item in
                Text(item.name)
                    .font(.system(.title3, design: .rounded))
                    .bold()
            }
            .navigationTitle("Whop Infinite Scroll")
            
            if !isLoading {
                ProgressView()
                    .padding()
                    .foregroundColor(.red)
                    .onAppear() {
                        loadMore()
                    }
            }
        }.onAppear() {
            setup()
        }
    }
    
    func setup() {
        guard !isSetupFinished else {
            return
        }
        isSetupFinished = true
        print("setup ")
        for i in 0..<20 {
            let isEven = i % 2
            if isEven == 0 {
                sampleMenuItems.append(MenuItem(name: "Menu", subMenuItems: subMenuItems))
            } else {
                sampleMenuItems.append(MenuItem(name: "Web Cell Link"))
            }
        }
    }
    
    func loadMore() {
        
        if !isLoading {
            isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                
                for i in sampleMenuItems.count + 1..<sampleMenuItems.count + 20 {
                    let isEven = i % 2
                    if isEven == 0 {
                        sampleMenuItems.append(MenuItem(name: "Menu \(i)", subMenuItems: subMenuItems))
                    } else {
                        sampleMenuItems.append(MenuItem(name: "Web Cell Link \(i)"))
                    }
                }
                
                isLoading = false
            }
        }
        
    }
}
