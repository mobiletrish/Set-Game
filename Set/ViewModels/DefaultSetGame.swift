//
//  DefaultSetGame.swift
//  Set
//
//  Created by Patricia Fulk on 9/23/21.
//

import SwiftUI

class DefaultSetGame: ObservableObject {
    typealias Card = DefaultSet
    
    typealias Color = DefaultSet.Color
    typealias Number = DefaultSet.Number
    typealias Shape = DefaultSet.Shape
    typealias Shading = DefaultSet.Shading
    
    @Published private var model: SetGame<DefaultSet>

    init() {
        let cards = DefaultSet.deckOfCards().shuffled()
        model = SetGame<DefaultSet>(cards: cards)
        dealCards()
    }
    
    var cards: Array<Card> {
        // Do not need to include cards that are still in the deck  
        model.cards.filter{ $0.state != .indeck }
    }

    // MARK: - Intent(s)
    func dealCards() {
        model.dealCards()
    }
        
    func dealThreeMoreCards() {
        model.dealThreeMoreCards()
    }
    
    func newCardGame() {
        let cards = DefaultSet.deckOfCards().shuffled()
        model = SetGame<DefaultSet>(cards: cards)
        dealCards()
    }

    func choose(_ card: DefaultSet) {
        model.choose(card)
    }
}
