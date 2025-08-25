//
//  Buttons.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//
import SwiftUI

struct NoOpacityChangeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // You can add other modifiers here for visual appearance
            // without affecting the touch feedback opacity.
    }
}
