//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Brent Vervaet on 17/06/2025.
//

import Foundation

struct MemorizeGame<CardContent> {
	var cards : Array<Card>
	
	func choose(_ card: Card){
		
	}
	
	func score() -> Int {
		return 0
	}
	
	struct Card {
		var isFaceUp: Bool
		var isMatched: Bool
		var content: CardContent
	}
}

