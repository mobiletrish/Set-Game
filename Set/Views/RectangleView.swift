//
//  Rectangle.swift
//  Set
//
//  Created by Patricia Fulk on 10/12/21.
//

import SwiftUI

struct RectangleView: View {
    var color: String
    var number: Int
    var shading: String
    
    var body: some View {
        ForEach(1...number, id: \.self) { i in
            if shading == "solid" {
                Rectangle()
                    .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                    .foregroundColor(Color.named(color))
            } else if shading == "stripe" {
                Rectangle()
                    .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                    .foregroundColor(Color.named(color).opacity(DrawingConstants.opacity))
            } else {
                Rectangle()
                    .stroke(Color.named(color), lineWidth: DrawingConstants.lineWidth)
                    .background(Rectangle()
                                    .fill(Color.white))
                    .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
            }
        }
        .padding(DrawingConstants.viewPadding)
    }
    private struct DrawingConstants {
        static let opacity: Double = 0.3
        static let lineWidth: CGFloat = 3
        static let aspectRatio: CGFloat = 1.5
        static let viewPadding: CGFloat = 5
    }
}

//struct RectangleView_Previews: PreviewProvider {
//    static var previews: some View {
//        RectangleView()
//            .foregroundColor(Color.name(color))
//    }
//}
