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
		Image("sample")
			.resizable()
			.scaledToFit()
		Text("Figure 3: Illustration of how treatment bias in training dataset leads to wrong incentive decisions. There are three types of users: active (red), ordinary (blue), and inactive (green). Each type has higher response rate to higher incentive (cost). However, in collected data, user activity is negatively correlated with incentive. A DNN model without knowledge of this bias will follow the dotted line, which does not reflect the causal effect of incentive. Based on this DNN model, a decision engine will never use any incentive larger than the wrong best cost")
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
