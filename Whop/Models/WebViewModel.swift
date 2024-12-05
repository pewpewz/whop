//
//  WebViewModel.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//

import Foundation

class WebViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var shouldGoBack: Bool = false
    @Published var title: String = ""

    var url: String

    init(url: String) {
        self.url = url
    }

}
