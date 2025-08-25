//
//  GreenGenericButton.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI

struct GreenGenericButton: View {
    var buttonAction: () -> Void
    var buttonText: String
    @State private var buttonScale: CGFloat = 1.0
    
    // Constants
    let animationDuration = 0.1
    let maxScaleUp = 1.1
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: animationDuration)) {
                buttonScale = maxScaleUp
            } completion: {
                withAnimation(.easeInOut(duration: animationDuration)) {
                    buttonScale = 1.0
                } completion: {
                    // button action
                    self.buttonAction()
                }
            }
        }) {
            Text(self.buttonText)
            .padding()
            .foregroundColor(.white)
            .background(Color.quimeraGreen)
            .cornerRadius(100)
            .scaleEffect(buttonScale)
        }
    }
}

#Preview {
    GreenGenericButton(buttonAction: {}, buttonText: "Start Aire")
}
