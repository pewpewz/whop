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
            .font(.system(.headline, design: .rounded))
            .bold()
    }
}
