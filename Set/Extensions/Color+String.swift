//
//  Color+String.swift
//  Set
//
//  Created by Patricia Fulk on 10/14/21.
//

import SwiftUI

extension Color {
    static func named(_ color: String) -> Color {
        switch color {
        case "blue":
            return Color.blue
        case "red":
            return Color.red
        case "green":
            return Color.green
        default:
            return Color.black
        }
    }
}
