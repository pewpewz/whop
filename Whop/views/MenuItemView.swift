//
//  MenuItemView.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import SwiftUI

struct MenuItemView: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.system(.title3, design: .rounded))
            .frame(maxWidth: .infinity, alignment: .leading)
            .bold()
            .background(Color.gray.opacity(0.001))
            .onTapGesture {
                print("Text Tapped")
            }
    }
}

#Preview {
    MenuItemView(name: "Menu Item")
}
