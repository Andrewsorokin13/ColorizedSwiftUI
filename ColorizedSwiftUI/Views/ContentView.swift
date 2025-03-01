//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Андрей Сорокин on 01.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var redColorValue = Double.random(in: 0...255).rounded()
    @State private var greenColorValue = Double.random(in: 0...255).rounded()
    @State private var blueColorValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var focusedTextField: ColorTextField?
    
    var body: some View {
        VStack {
            ColorView(red: redColorValue, green: greenColorValue, blue: blueColorValue)
            
            VStack {
                ColorSliderView(value: $redColorValue, color: .red)
                    .focused($focusedTextField, equals: .red)
                ColorSliderView(value: $greenColorValue, color: .green)
                    .focused($focusedTextField, equals: .green)
                ColorSliderView(value: $blueColorValue, color: .blue)
                    .focused($focusedTextField, equals: .blue)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .toolbar  {
            ToolbarItemGroup(placement: .keyboard) {
                Button(action: moveToPreviousField) {
                    Image(systemName: "chevron.up")
                }
                Button(action:  moveToNextField) {
                    Image(systemName: "chevron.down")
                }
                
                Spacer()
                Button("Done") {
                    focusedTextField = nil
                }
            }
        }
    }
    
}

private extension ContentView {
    enum ColorTextField {
        case red
        case green
        case blue
    }
    
    func moveToNextField() {
        switch focusedTextField {
        case .red:
            focusedTextField = .green
        case .green:
            focusedTextField = .blue
        case .blue:
            focusedTextField = .red
        case nil:
            focusedTextField = nil
        }
    }
    
    func moveToPreviousField() {
        switch focusedTextField {
        case .red:
            focusedTextField = .blue
        case .green:
            focusedTextField = .red
        case .blue:
            focusedTextField = .green
        case nil:
            focusedTextField = nil
        }
    }
}

#Preview {
    ContentView()
}
