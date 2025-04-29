//
//  TodoToggle.swift
//  Synap
//
//  Created by Eric Klaesson on 28/4/25.
//

import SwiftUI

struct TodoToggle: View {
    @Binding var isOn: Bool
        
    var body: some View {
        Button(action: {
            isOn.toggle()
        }) {
            Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 20))
                .foregroundColor(isOn ? .green : .gray)
        }
        .buttonStyle(.plain)  // Removes any extra button styling
    }
}

#Preview {
    TodoToggle(isOn: .constant(true))
}
