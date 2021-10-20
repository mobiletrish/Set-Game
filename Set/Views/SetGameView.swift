//
//  SetGameView.swift
//  Set
//
//  Created by Patricia Fulk on 9/22/21.
//

import SwiftUI

struct SetGameView: View {
    @ObservedObject var game: DefaultSetGame
    
    var body: some View {
        VStack {
            VStack {
                Text("Set Game")
                    .font(.largeTitle)
            }
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                cardView(for: card)
            })
            .foregroundColor(.green)
            .padding(.horizontal)
            
            Spacer()
            newGameButton
            Spacer()
        }
    }

    @ViewBuilder
    private func cardView(for card: DefaultSetGame.Card) -> some View {
        if card.state == .matched {
            Rectangle().opacity(0)
        } else if card.state == .delt || card.state == .selected {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    game.choose(card)
                }
        }
    }

    var newGameButton: some View {
        Button(action: {
            game.newCardGame()
        }, label: {
          Text("New Game")
            .foregroundColor(.black)
        })
        //.buttonStyle(RoundedRectangleButtonStyle())
    }

}


struct CardView: View {
    var card: DefaultSet
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)

                if card.state == .selected {
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth: DrawingConstants.lineWidth)
                    if card.shape == .diamond {
                        DiamondView(color: card.color.rawValue, number: card.number.rawValue, shading: card.shading.rawValue)
                    } else if card.shape == .oval {
                        OvalView(color: card.color.rawValue, number: card.number.rawValue, shading: card.shading.rawValue)
                    } else if card.shape == .rectangle {
                        RectangleView(color: card.color.rawValue, number: card.number.rawValue, shading: card.shading.rawValue)
                    }
                } else if card.state == .delt {
                    shape.fill()
                }
            }
        }
    }

    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}


struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = DefaultSetGame()
        Group {
            SetGameView(game: game)
            SetGameView(game: game)
        }
    }
}
