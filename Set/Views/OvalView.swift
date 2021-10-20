//
//  Oval.swift
//  Set
//
//  Created by Patricia Fulk on 10/12/21.
//

import SwiftUI

struct OvalView: View {
    var color: String
    var number: Int
    var shading: String
    
    var body: some View {
        VStack {
            ForEach(1...number, id: \.self) { i in
                if shading == "solid" {
                    Capsule()
                        .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                        .foregroundColor(Color.named(color))
                } else if shading == "stripe" {
                    Capsule()
                        .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                        .foregroundColor(Color.named(color).opacity(DrawingConstants.opacity))
                } else {
                    // TODO: this should be only a border in color and a fill of white
                    Capsule()
                        .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                        .border(Color.named(color), width: DrawingConstants.lineWidth)
                }
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

//struct OvalView_Previews: PreviewProvider {
//    static var previews: some View {
//        OvalView()
//    }
//}
