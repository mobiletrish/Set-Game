//
//  Card.swift
//  Set
//
//  Created by Patricia Fulk on 9/29/21.
//

import Foundation

protocol Card: Identifiable {
    var id: Int { get set }
    var state: State { get set }
    
    associatedtype Color: Hashable
    associatedtype Number: Hashable
    associatedtype Shape: Hashable
    associatedtype Shading: Hashable
    
    var color: Color { get }
    var number: Number { get }
    var shape: Shape { get }
    var shading: Shading { get }

    static func deckOfCards() -> [Self]
 }

enum State {
    case indeck, delt, selected, matched
}
