//
//  MenuItem.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import Foundation

struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var subMenuItems: [MenuItem]?
}

