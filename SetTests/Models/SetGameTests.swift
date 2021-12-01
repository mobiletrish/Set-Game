//
//  SetGameTests.swift
//  SetTests
//
//  Created by Patricia Fulk on 11/19/21.
//

import XCTest
@testable import Set

class SetGameTests: XCTestCase {
    var sut: SetGame<DefaultSet>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SetGame<DefaultSet>(cards: defineDeltCards())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testChooseNotAMatchingSet() throws {
        sut = SetGame<DefaultSet>(cards: defineDeltCardsWithoutMatchingSet())
        //TODO: this isn't working the way it should
        sut.choose(sut.cards[0])
        sut.choose(sut.cards[1])
        sut.choose(sut.cards[2])
        sut.choose(sut.cards[3])
 
        XCTAssert(sut.cards.filter{$0.state == .matched}.count != 3 )
    }
    
    func testChooseAMatingSetWithSelectedColorsAllDifferent() throws {
        sut = SetGame<DefaultSet>(cards: defineDeltCards())

        let firstMatchingCard = sut.cards.filter{$0.color == .blue && $0.state == .delt}.first!
        let secondMatchingCard = sut.cards.filter{$0.color == .red && $0.state == .delt}.first!
        let thirdMatchingCard = sut.cards.filter{$0.color == .green && $0.state == .delt}.first!
        
        sut.choose(firstMatchingCard)
        sut.choose(secondMatchingCard)
        sut.choose(thirdMatchingCard)
        sut.choose(sut.cards.filter{$0.state == .delt}.first!)
        
        XCTAssert(sut.cards.filter{$0.state == .matched}.count == 3 )
    }
    
    func testChooseAMatingSetWithSelectedShapesAllDifferent() throws {
        sut = SetGame<DefaultSet>(cards: defineDeltCards())

        let firstMatchingCard = sut.cards.filter{$0.shape == .diamond && $0.state == .delt}.first!
        let secondMatchingCard = sut.cards.filter{$0.shape == .oval && $0.state == .delt}.first!
        let thirdMatchingCard = sut.cards.filter{$0.shape == .rectangle && $0.state == .delt}.first!
        
        sut.choose(firstMatchingCard)
        sut.choose(secondMatchingCard)
        sut.choose(thirdMatchingCard)
        sut.choose(sut.cards.filter{$0.state == .delt}.first!)
        
        XCTAssert(sut.cards.filter{$0.state == .matched}.count == 3 )
    }

    func testChooseAMatingSetWithSelectedShadingsAllDifferent() throws {
        sut = SetGame<DefaultSet>(cards: defineDeltCards())

        let firstMatchingCard = sut.cards.filter{$0.shading == .solid && $0.state == .delt}.first!
        let secondMatchingCard = sut.cards.filter{$0.shading == .stripe && $0.state == .delt}.first!
        let thirdMatchingCard = sut.cards.filter{$0.shading == .none && $0.state == .delt}.first!
        
        sut.choose(firstMatchingCard)
        sut.choose(secondMatchingCard)
        sut.choose(thirdMatchingCard)
        sut.choose(sut.cards.filter{$0.state == .delt}.first!)
        
        XCTAssert(sut.cards.filter{$0.state == .matched}.count == 3 )
    }

    func testChooseThreeColorsMatch() throws {
        let cardsThatAreBlue = sut.cards.filter{$0.color == .blue && $0.state == .delt}

        sut.choose(cardsThatAreBlue[0])
        sut.choose(cardsThatAreBlue[1])
        sut.choose(cardsThatAreBlue[2])
        sut.choose(sut.cards.filter{$0.state == .delt}.first!)
        
        XCTAssert(sut.cards.filter{$0.color == .blue && $0.state == .matched}.count == 3 )
    }

    func testChooseThreeShapesMatch() throws {
        let cardsThatAreDiamond = sut.cards.filter{$0.shape == .diamond && $0.state == .delt}

        sut.choose(cardsThatAreDiamond[0])
        sut.choose(cardsThatAreDiamond[1])
        sut.choose(cardsThatAreDiamond[2])
        sut.choose(sut.cards.filter{$0.state == .delt}.first!)
        
        XCTAssert(sut.cards.filter{$0.shape == .diamond && $0.state == .matched}.count == 3 )
    }

    func testChooseThreeNumbersMatch() throws {
        let cardsThatAreOne = sut.cards.filter{$0.number == .one && $0.state == .delt}

        sut.choose(cardsThatAreOne[0])
        sut.choose(cardsThatAreOne[1])
        sut.choose(cardsThatAreOne[2])
        sut.choose(sut.cards.filter{$0.state == .delt}.first!)
        
        XCTAssert(sut.cards.filter{$0.number == .one && $0.state == .matched}.count == 3 )
    }

    func testChooseThreeShadingsMatch() throws {
        let cardsThatAreSolid = sut.cards.filter{$0.shading == .solid && $0.state == .delt}

        sut.choose(cardsThatAreSolid[0])
        sut.choose(cardsThatAreSolid[1])
        sut.choose(cardsThatAreSolid[2])
        sut.choose(sut.cards.filter{$0.state == .delt}.first!)
        
        XCTAssert(sut.cards.filter{$0.shading == .solid && $0.state == .matched}.count == 3 )

    }
    
    //MARK: Private Methods
    private func defineDeltCards() -> Array<DefaultSet>  {
        var cards = DefaultSet.deckOfCards().shuffled()
        cards.indices.forEach{ cards[$0].state = .indeck }
        cards.indices.filter{cards[$0].color == .blue}.prefix(3).forEach{ cards[$0].state = .delt }
        cards.indices.filter{cards[$0].number == .one}.prefix(3).forEach{ cards[$0].state = .delt }
        cards.indices.filter{cards[$0].shape == .diamond}.prefix(3).forEach{ cards[$0].state = .delt }
        cards.indices.filter{cards[$0].shading == .solid}.prefix(3).forEach{ cards[$0].state = .delt }
        return cards
    }
    
    private func defineDeltCardsWithoutMatchingSet() -> Array<DefaultSet> {
        var cards = DefaultSet.deckOfCards().shuffled()
        cards.indices.forEach{ cards[$0].state = .indeck }
        cards.indices.filter{cards[$0].color == .blue && cards[$0].number == .two && cards[$0].shape == .diamond && cards[$0].shading == .none && cards[$0].state == .delt}.prefix(1).forEach{ cards[$0].state = .delt }
        cards.indices.filter{cards[$0].color == .red && cards[$0].number == .one && cards[$0].shape == .oval && cards[$0].shading == .solid && cards[$0].state == .delt}.prefix(1).forEach{ cards[$0].state = .delt }
        cards.indices.filter{cards[$0].color == .red && cards[$0].number == .one && cards[$0].shape == .oval && cards[$0].shading == .solid && cards[$0].state == .delt}.prefix(1).forEach{ cards[$0].state = .delt }
        cards.indices.filter{cards[$0].color == .red && cards[$0].number == .two && cards[$0].shape == .diamond && cards[$0].shading == .none && cards[$0].state == .delt}.prefix(1).forEach{ cards[$0].state = .delt }
        return cards
    }
}
