//
//  TextFieldView.swift
//  ColorizedSwiftUI
//
//  Created by Андрей Сорокин on 01.03.2025.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var text: String
    
    let action: () -> Void
    
    var body: some View {
        TextField("", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 50, alignment: .center)
        .multilineTextAlignment(.center)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
    }
}

#Preview {
    TextFieldView(text: .constant("255"), action: {})
}
