//
//  TextView.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import SwiftUI

struct TextView: View {
    @State var color: Color
    let text: String
    
    var numbers = Array(0...5)
    
    var body: some View {
        Text("\(text)!")
            .fontWeight(.semibold)
            .padding()
            .foregroundStyle(.white)
            .background(color.opacity(0.4))
            .font(.callout)
            .cornerRadius(20)
            .shadow(color: color, radius: 5, x: 10, y: 10)
            .onTapGesture {
                print("hello tap")
                expand()
                changeColor()
            }
    }
    
    func changeColor() {
        self.color = .red
    }
    func expand() {
        print(" will expand on code hit here")
    }
}

#Preview {
    TextView(color: .blue, text: "Testing Hello")
}
