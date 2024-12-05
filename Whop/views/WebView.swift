//
//  WebView.swift
//  Whop
//
//  Created by Terry Lee on 12/4/24.
//
import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        print("makeUIView called...")
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        print("updateUIView called...")
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        print("makeCoordinator called...")
        let coord = Coordinator()
        return coord
    }

    @MainActor class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
            print("Delegate called...")
            if let frame = navigationAction.targetFrame, frame.isMainFrame {
                print("Target is main frame...")
                return .allow
            } else {
                print("Target is external...")
                return .cancel
            }
        }
    }
}
