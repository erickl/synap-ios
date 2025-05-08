//
//  PartialToggle.swift
//  Synap
//
//  Created by Eric Klaesson on 29/4/25.
//

import SwiftUI

struct ProgressIndicator: View {
    var progress: Decimal = 0 // 0.0 <= x <= 1.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 6)

            let progressDouble = NSDecimalNumber(decimal: progress).doubleValue
            Circle()
                .trim(from: 0, to: progressDouble)
                .stroke(Color.green, lineWidth: 6)
                .rotationEffect(.degrees(-90)) // start at top
            
            if(self.progress >= 1) {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.green)
            }
        }
        .frame(width: 20, height: 20)
    }
}

#Preview {
    ProgressIndicator(progress: 0.75)
}
