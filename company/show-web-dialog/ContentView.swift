//
//  ContentView.swift
//  Test
//
//  Created by HaiPham on 08/03/2024.
//

import SwiftUI

struct ContentView: View {
	@State var presentingModal = false
	
	var body: some View {
		Text("Hello, world!")
			.padding()
		
		Button("Show dialog") {
			self.presentingModal = true
		}
		.fullScreenCover(isPresented: $presentingModal) {
			ContentView1(presentedAsModal: $presentingModal)
				.background(BackgroundClearView())
		}
	}
}

struct ContentView1: View {
	@Binding var presentedAsModal: Bool
	@State var presentingModal = false
	
	var body: some View {
		Button("dismiss") { self.presentedAsModal = false }
		WebSiteView()
//
//		Button("Show dialog") {
//			self.presentingModal = true
//		}
		
//		if presentingModal {
//			Dialog()
//		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundClearView: UIViewRepresentable {
	func makeUIView(context: Context) -> UIView {
		let view = UIView()
		DispatchQueue.main.async {
			view.superview?.superview?.backgroundColor = .clear
		}
		return view
	}

	func updateUIView(_ uiView: UIView, context: Context) {}
}
