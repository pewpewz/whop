//
//  MenuItem.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import Foundation

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var subMenuItems: [MenuItem]?
}

