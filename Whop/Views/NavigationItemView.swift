//
//  NavigationItemView.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import SwiftUI

struct NavigationItemView: View {
    let name: String
    let value: MenuItem
    
    var body: some View {
        NavigationLink(name, value: value)
            .font(.system(.title2, design: .rounded))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
