//
//  Extension+Color.swift
//  ColorizedSwiftUI
//
//  Created by Андрей Сорокин on 01.03.2025.
//

import SwiftUI

extension Color {
    init(fromRGB red: Double, green: Double, blue: Double) {
        let normalizedRed = red / 255.0
        let normalizedGreen = green / 255.0
        let normalizedBlue = blue / 255.0
        
        self = Color(red: normalizedRed, green: normalizedGreen, blue: normalizedBlue)
    }
}
