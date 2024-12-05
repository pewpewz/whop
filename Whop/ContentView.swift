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
                if item.subMenuItems?.isEmpty == false {
                    MenuItemView(name: item.name)
                } else {
                    NavigationItemView(name: item.name, value: item)
                }
            }
            .navigationDestination(for: MenuItem.self) { menuItem in
                WebViewContainer(webViewModel: WebViewModel(url: menuItem.url))
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
        createRows(0, 20)
    }
    
    func createRows(_ start: Int, _ end: Int) {
        for i in start..<end {
            let isEven = i % 2
            if isEven == 0 {
                sampleMenuItems.append(.init(name: "Dropdown Menu", url: "", subMenuItems: subMenuItemsMock))
            } else {
                let itemLink = mockURLs.randomElement()!
                sampleMenuItems.append(.init(name: "\(itemLink.0)", url: itemLink.1))
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

let subMenuItemsMock:[MenuItem] = [.init(name: "StockX", url: "https://stockx.com"),
                                   .init(name: "Whop", url: "https://whop.com"),
                                   .init(name: "Amazon", url: "https://amazon.com")]

let mockURLs: [(String, String)] = [
    ("Whop", "https://whop.com"),
    ("StockX","https://stockx.com"),
    ("Amazon","https://amazon.com"),
    ("Blizzard","https://www.blizzard.com/en-us/"),
    ("Apple","https://www.apple.com/"),
    ("Tesla","https://www.tesla.com/")
]
