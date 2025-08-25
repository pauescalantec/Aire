//
//  QuimeraButton.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//


import SwiftUI

// Quimera flower button with scale up/down on touch
// Parameters:
// isTouchable: Bool - plays animation on touch if true
// action: function that implements the action of the button
struct GreenQuimeraButton: View {
    var isTouchable: Bool
    var action: () -> Void
    @State private var imageScale: CGFloat = 1.0
    
    var body: some View {
        Button(action: {
            if isTouchable {
                withAnimation(.easeInOut(duration: 0.5)) {
                    imageScale = 1.5 // Scale up to 150%
                } completion: {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        imageScale = 1.0 // back down
                        
                        // call action
                        self.action()
                    }
                }
            }
        }) {
            Image("quimera_flower")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.tint)
                .scaleEffect(imageScale)
        }
        .buttonStyle(NoOpacityChangeButtonStyle())
    }
}

#Preview {
    GreenQuimeraButton(isTouchable: false, action: {})
}



