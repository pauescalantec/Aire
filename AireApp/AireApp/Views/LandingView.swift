//
//  LandingView.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI

struct LandingView: View {
    var startAppAction: () -> Void

    var body: some View {
        GreenGenericButton(buttonAction: startAppAction, buttonText: "Start Aire")
    }
}

#Preview {
    LandingView(startAppAction: {})
}
