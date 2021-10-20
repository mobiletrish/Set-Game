//
//  SetGame.swift
//  Set
//
//  Created by Patricia Fulk on 9/22/21.
//

import Foundation

struct SetGame<CardType> where CardType: Card {
    private(set) var cards: Array<CardType>

    private var cardsSelected: Array<CardType> {
        cards.filter{$0.state == State.selected }
    }

    init(cards: Array<CardType>) {
        self.cards = cards
    }
    
    mutating func dealCards() {
        cards.indices.forEach{ cards[$0].state = State.indeck }
        cards.prefix(12).indices.forEach { cards[$0 ].state = State.delt }
    }
    
    mutating func choose(_ card: CardType) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           cards[chosenIndex].state == .delt {
            if cardsSelected.count < 3 {
                cards[chosenIndex].state = .selected
            } else {
                // we have 3 cards selected, are they matching?
                if doWeHaveAMatchingSet()
                {
                    cards.indices.filter{cards[$0].state == .selected}.forEach{ cards[$0].state = .matched }
                    dealThreeMoreCards()
                } else {
                    cards.indices.filter{cards[$0].state == .selected}.forEach{ cards[$0].state = .indeck }
                }
             }
        }
    }
    
    mutating func dealThreeMoreCards() {
        cards.indices.filter{cards[$0].state == .indeck}.prefix(3).forEach{ cards[$0].state = .delt }
    }
    
    //MARK: Private Methods
    private func doWeHaveAMatchingSet() -> Bool {
        var selectedCardsColorTheSame: Bool {
            cardsSelected.dropFirst().allSatisfy{ $0.color == cardsSelected.first?.color }
        }
        
        var selectedCardsColorAllDifferent: Bool {
            Set(cardsSelected.map{ $0.color }).count == 3
        }
        
        var selectedCardsNumberTheSame: Bool {
            cardsSelected.dropFirst().allSatisfy{ $0.number == cardsSelected.first?.number }
        }
        
        var selectedCardsNumberAllDifferent: Bool {
            Set(cardsSelected.map{ $0.number }).count == 3
        }

        var selectedCardsShapeTheSame: Bool {
            cardsSelected.dropFirst().allSatisfy{ $0.shape == cardsSelected.first?.shape }
        }
        
        var selectedCardsShapeAllDifferent: Bool {
            Set(cardsSelected.map{ $0.shape }).count == 3
        }

        var selectedCardsShadingTheSame: Bool {
            cardsSelected.dropFirst().allSatisfy{ $0.shading == cardsSelected.first?.shading }
        }
        
        var selectedCardsShadingAllDifferent: Bool {
            Set(cardsSelected.map{ $0.shading }).count == 3
        }

        if selectedCardsColorTheSame || selectedCardsColorAllDifferent ||
            selectedCardsNumberTheSame || selectedCardsNumberAllDifferent ||
            selectedCardsShapeTheSame || selectedCardsShapeAllDifferent ||
            selectedCardsShadingTheSame || selectedCardsShadingAllDifferent
        {
            return true
        }
        return false
    }
}
