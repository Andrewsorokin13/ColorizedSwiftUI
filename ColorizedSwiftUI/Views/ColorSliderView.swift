//
//  ColorSliderView.swift
//  ColorizedSwiftUI
//
//  Created by Андрей Сорокин on 01.03.2025.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State var isPresentedAlert: Bool = false
    @State var text: String = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            Text(value.formatted())
                .foregroundColor(.black)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { _, newValue in
                    text = newValue.formatted()
                }
            
            TextFieldView(text: $text, action: validateAndUpdateValue)
                .alert("Ошибка формата!", isPresented: $isPresentedAlert, actions: {}) {
                    Text("Пожалуйста, введите число от 0 до 255")
                }
                .onAppear {
                    text = value.formatted()
                }
        }
    }
}

private extension ColorSliderView {
    func validateAndUpdateValue() {
        guard
            let value = Double(text),
            (0...255).contains(value) else {
            showAlertForInvalidInput()
            return
        }
        self.value = value
    }
    
    func showAlertForInvalidInput() {
        isPresentedAlert.toggle()
        self.value = 0
        text = "0"
    }
}

#Preview {
    ColorSliderView(value: .constant(120), color: .orange)
}
