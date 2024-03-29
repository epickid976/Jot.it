//
//  CustomField.swift
//  Service Maps 2.0
//
//  Created by Jose Blanco on 8/8/23.
//

import Foundation
import SwiftUI

struct CustomField: View {
    @Binding var text: String
    var isFocused: FocusState<Bool>.Binding // Use FocusState for focus state
    var textfield: Bool
    var keyboardType: UIKeyboardType?
    var textAlignment: TextAlignment?
    var textfieldAxis: Axis?
    var lineLimit: Int?
    let placeholder: String
    
    var body: some View {
        if textfield {
            TextField(placeholder, text: $text, axis: textfieldAxis ?? .horizontal)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                .font(.system(size: 16, weight: .regular))
                .accentColor(.blue)
                .focused(isFocused) // Use the isFocused binding property of FocusState
                .gesture(TapGesture().onEnded {
                    // Handle tap action
                    isFocused.wrappedValue = true // Use the isFocused binding property of FocusState
                })
                .keyboardType(keyboardType ?? .default)
                .multilineTextAlignment(textAlignment ?? .leading)
                .frame(minHeight: 40)
                .lineLimit(lineLimit ?? 0)
                .fixedSize(horizontal: false, vertical: true)
        } else {
            SecureField(placeholder, text: $text)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                .font(.system(size: 16, weight: .regular))
                .accentColor(.blue)
                .focused(isFocused) // Use the isFocused binding property of FocusState
                .gesture(TapGesture().onEnded {
                    // Handle tap action
                    isFocused.wrappedValue = true // Use the isFocused binding property of FocusState
                })
                .keyboardType(keyboardType ?? .default)
                .multilineTextAlignment(textAlignment ?? .leading)
                .frame(minHeight: 40)
        }
            
    }
}

