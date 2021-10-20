//
//  DefaultSet.swift
//  Set
//
//  Created by Patricia Fulk on 9/23/21.
//

import Foundation

struct DefaultSet: Card, Identifiable {

    var id: Int
    var state: State = .indeck
    
    private(set) var color: Color
    private(set) var number: Number
    private(set) var shape: Shape
    private(set) var shading: Shading
    
    enum Color: String,CaseIterable {
        case red, green, blue
    }
    enum Number: Int,CaseIterable {
        case one=1, two, three
    }
    enum Shape: String,CaseIterable {
        case diamond, rectangle, oval
    }
    enum Shading: String,CaseIterable {
        case solid, stripe, none
    }
    
    static func deckOfCards() -> Array<DefaultSet> {
        var cards:[DefaultSet] = []
        var id: Int = 0
        for colorCase in Color.allCases {
            for numberCase in Number.allCases {
                for shapeCase in Shape.allCases {
                    for shadingCase in Shading.allCases {
                        cards.append(DefaultSet(id: id, color: colorCase, number: numberCase, shape: shapeCase, shading: shadingCase));
                        id+=1
                    }
                }
            }
        }
        return cards
    }
}
