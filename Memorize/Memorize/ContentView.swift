//
//  ContentView.swift
//  Memorize
//
//  Created by Brent Vervaet on 13/06/2025.
//

import SwiftUI

struct ContentView: View {// View -> behaves like a ... a protocol
	
	var body: some View {
		//Computed property //some -> can be anything as long as it behaves like a View
		var _: String //property of this struct (String)
		HStack{
			CardView(isFaceUp: true)
			CardView()
			CardView()
			CardView()
			//test
		}
		.padding()
		.foregroundColor(.orange)
	}
	
	
	struct CardView: View {
		var isFaceUp: Bool = false
		var body: some View {
			ZStack {
				if isFaceUp {
					RoundedRectangle(cornerRadius: 12).fill(.white)
					RoundedRectangle(cornerRadius: 12)
						.strokeBorder(lineWidth: 5)
					Text("👻").font(.largeTitle)
				}else{
					RoundedRectangle(cornerRadius: 12)
				}
			}
		}
	}
}






















#Preview {
	ContentView()
}
