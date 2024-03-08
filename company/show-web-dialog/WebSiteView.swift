//
//  WebSiteView.swift
//  Test
//
//  Created by HaiPham on 08/03/2024.
//

// Source: https://alexpaul.dev/2023/01/19/rendering-web-content-in-swiftui-using-uiviewrepresentable-html-and-css/

import WebKit
import SwiftUI// 1

// 1
// Create a custom `UIViewRepresentable` that will render web content.
struct HTMLView: UIViewRepresentable {
	typealias UIViewType = WKWebView
 
	// 4
	// Access the `homepage.html` file that is stored in the app bundle
	var fileURL: URL {
		guard let url = Bundle.main.url(forResource: "homepage", withExtension: "html") else {
			fatalError("path does not exist")
		}
		return url
	}
 
	/// Accepts a user HTML string e.g <p>SwiftUI is <b>awesome</b></p>
	var htmlString: String?
 
	func makeUIView(context: Context) -> WKWebView {
		// 5
		// Configure the WKWebView
		let config = WKWebViewConfiguration()
		let webView = WKWebView(frame: .zero, configuration: config)
		// 6
		// Part of the configuration is to allow for back-and-forth navigation between web pages.
		webView.allowsBackForwardNavigationGestures = true
		return webView
	}
 
	func updateUIView(_ uiView: WKWebView, context: Context) {
		guard let htmlString = htmlString else {
			// 7
			// Load the `homepage.html` page (has CSS styling), refer to `styles.css`
			uiView.loadFileURL(fileURL, allowingReadAccessTo: fileURL)
			return
		}
		// 8
		// If the user passes an HTML string this page will be rendered
		uiView.loadHTMLString(htmlString, baseURL: nil)
	}
}

struct WebSiteView: View {
	var body: some View {
		VStack {
			// 2
			// Embed the custom `UIViewRepresentable` View which has HTML content in your SwiftUI View.
			HTMLView()
				.frame(height: 500)
				// 3
				// SwiftUI cannot style the rendered `HTMLView`, we have to style the HTML server-side
				// or in this case, use a local CSS file.
				.foregroundColor(.teal)
			Text("Another regular SwiftUI View")
				.font(.subheadline)
				.padding(.top, 20)
		}
		.frame(maxHeight: .infinity)
	}
}
