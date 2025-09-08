//
//  ContentView.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI

struct MainAppView: View {
    @State private var aireModel = AireModel()

    var body: some View {
        VStack {
            if !aireModel.showCameraView {
                LandingView(startAppAction: {
                    // Boolean that controls the show camera
                    aireModel.showCameraView.toggle()
                    aireModel.fetchAirQuality()
                })
            } else {
                // Show AR view
                ARCameraView(aireModel: aireModel)
            }

        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MainAppView()
}
