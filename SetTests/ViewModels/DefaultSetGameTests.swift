//
//  DefaultSetGameTests.swift
//  SetTests
//
//  Created by Patricia Fulk on 11/23/21.
//

import XCTest
@testable import Set

class DefaultSetGameTests: XCTestCase {
    var sut: DefaultSetGame!

    override func setUpWithError() throws {
        sut = DefaultSetGame()
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testDealThreeMoreCards() throws {
        let count = sut.cards.count
        sut.dealThreeMoreCards()
        XCTAssert(count + 3 == sut.cards.count)
    }
    
    func testNewCardGame() throws {
        let firstDeck = sut.cards
        sut.newCardGame()
        // TODO: Check if this is really the test
        XCTAssert(firstDeck != sut.cards)
    }
    
    func testChoose() throws {
        sut.choose(sut.cards[0])
        XCTAssert(sut.cards[0].state == .selected)
    }

}
