//
//  Diamond.swift
//  Set
//
//  Created by Patricia Fulk on 10/12/21.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct DiamondView: View {
    var color: String
    var number: Int
    var shading: String

    var body: some View {
        VStack {
            ForEach(1...number, id: \.self){ i in
                if shading == "solid" {
                    Diamond()
                        .fill(Color.named(color))
                } else if shading == "stripe" {
                    Diamond()
                        .fill(Color.named(color).opacity(DrawingConstants.opacity))
                } else {
                    Diamond()
                        .stroke(Color.named(color), lineWidth: DrawingConstants.lineWidth)
                }
            }
        }
        .padding(DrawingConstants.viewPadding)
    }
    private struct DrawingConstants {
        static let opacity: Double = 0.3
        static let lineWidth: CGFloat = 3
        static let viewPadding: CGFloat = 5
    }
}


//struct Diamond_Previews: PreviewProvider {
//    static var previews: some View {
//        Diamond()
//    }
//}
