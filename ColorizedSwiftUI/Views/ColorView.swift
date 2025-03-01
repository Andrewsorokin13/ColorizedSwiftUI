//
//  ColorView.swift
//  ColorizedSwiftUI
//
//  Created by Андрей Сорокин on 01.03.2025.
//

import SwiftUI

struct ColorView: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(fromRGB: red, green: green, blue: blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 5)
            )
    }
}

#Preview {
    ColorView(red: 100, green: 100, blue: 0)
}
