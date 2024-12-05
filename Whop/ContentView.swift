//
//  ContentView.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isLoading:Bool = false
    
    @State var isSetupFinished:Bool = false
    
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
                ProgressView {
                    Text("Loading")
                    .foregroundColor(.pink)
                    .bold()
                    .padding()
                    .onAppear() {
                        loadMoreCells()
                    }
                }
            }
        }.onAppear() {
            setup()
        }
    }

    // setups the first 20 rows on appear
    func setup() {
        guard !isSetupFinished else {
            return
        }
        isSetupFinished = true
        createRows(0, 10)
    }
    
    func createRows(_ start: Int, _ end: Int) {
        for i in start..<end {
            let isEven = i % 2
            if isEven == 0 {
                sampleMenuItems.append(.init(name: "Row \(i)", subMenuItems: subMenuItemsMock))
            } else {
                sampleMenuItems.append(.init(name: "Row Web Link \(i)"))
            }
        }
    }
    
    func loadMoreCells() {
        
        if !isLoading {
            isLoading = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                createRows(sampleMenuItems.count + 1, sampleMenuItems.count + 20)
                isLoading = false
            }
        }
        
    }
}

let subMenuItemsMock:[MenuItem] = [.init(name: "More Cells"),
                                .init(name: "More Cells"),
                                .init(name: "More Cells")]
