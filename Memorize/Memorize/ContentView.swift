//
//  ContentView.swift
//  Memorize
//
//  Created by Brent Vervaet on 13/06/2025.
//

import SwiftUI

struct ContentView: View {// View -> behaves like a ... a protocol
	let emojis: Array<String> = ["🦄", "🐇", "🐢", "🦎", "🐍", "🐉", "🐌", "🐞", "🐜", "🐛"]
	@State var cardCount = 4
	var body: some View {
		//Computed property //some -> can be anything as long as it behaves like a View
		
		VStack{
			Text("Memorize!").font(.largeTitle)
			ScrollView{
				cards
			}
			Spacer()
			cardCountAdjusters
		}
		.padding()
	}
	
	var cards : some View {
		LazyVGrid(columns: 	[GridItem(.adaptive(minimum: 120))]){
			ForEach(0..<cardCount,id: \.self){ index in
				CardView(content: emojis[index])
					.aspectRatio(2/3, contentMode: .fit)
			}
		}
		.foregroundColor(.orange)
		
	}
	
	var cardCountAdjusters: some View {
		HStack{
			cardRemover
			Spacer()
			cardAdder
		}
		.font(.title)
	}
	
	func cardCountAdjuster(by offset: Int, symbol: String) -> some View{
		Button(action:{
			cardCount += offset
		},label: {
			Image(systemName: symbol)
		})
		.disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
	}
	
	var cardRemover: some View {
		cardCountAdjuster(by:-1, symbol: "minus")
	}
	
	var cardAdder: some View{
		cardCountAdjuster(by: +1, symbol: "plus")
	}
	
	
	
	
	struct CardView: View {
		@State var isFaceUp: Bool = true
		let content: String
		var body: some View {
			ZStack {
				let base = RoundedRectangle(cornerRadius: 12)
				Group {
					base.fill(.white)
					base.strokeBorder(lineWidth: 2)
					Text(content).font(.largeTitle)
				}
				.opacity(isFaceUp ? 1 : 0)
				base.fill().opacity(isFaceUp ? 0 : 1)
				
			}.onTapGesture {
				isFaceUp.toggle()
			}
		}
	}
	
}






















#Preview {
	ContentView()
}
