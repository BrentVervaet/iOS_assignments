//
//  ContentView.swift
//  Memorize
//
//  Created by Brent Vervaet on 13/06/2025.
//

import SwiftUI

struct ContentView: View {// View -> behaves like a ... a protocol
	let emojis = ["👻", "😱", "😈", "🕷️"]
	
	
	var body: some View {
		//Computed property //some -> can be anything as long as it behaves like a View
		var _: String //property of this struct (String)
		HStack{
			// let emojis: Array<String> = ["🦄", "🐇", "🐢", "🦎", "🐍", "🐉", "🐌", "🐞", "🐜", "🐛"]
			ForEach(0..<4,id: \.self){ index in
				CardView(content: emojis[index])

			}
			//test
		}
		.padding()
		.foregroundColor(.orange)
	}
	
	
	struct CardView: View {
		@State var isFaceUp: Bool = true
		let content: String
		var body: some View {
			ZStack {
				let base = RoundedRectangle(cornerRadius: 12)
				if isFaceUp {
					base.fill(.white)
					base.strokeBorder(lineWidth: 5)
					Text(content).font(.largeTitle)
				}else{
					base.fill()
				}
			}.onTapGesture {
				isFaceUp.toggle()
			}
		}
	}
}






















#Preview {
	ContentView()
}
