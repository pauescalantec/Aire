//
//  ARCameraView.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI

struct ARCameraView: View {
    @State var aireModel: AireModel
    let refreshString: String = String(localized: "Last refresh:")
    
    // Currently not in use
    //@ObservedObject var arDelegate = ARDelegate()
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            // ARKit version of the scene
            // ARCameraViewContainer(arDelegate: arDelegate)
            
            // RealityKit version of the scene
            RKCameraViewContainer()
            
            VStack {
                HStack {
                    GreenGenericButton(buttonAction: {
                        // toggle back to landing view
                        aireModel.showCameraView.toggle()
                    }, buttonText: "Go Back")
                    .padding(EdgeInsets(top: 25, leading: 10, bottom: 25, trailing: 10))
                    Spacer()
                }
                
                // Debug view for AR
                DebugView(aireModel: aireModel)
                
                Spacer()
                
                HStack {
                    Button {
                        aireModel.refreshAPI()
                    } label: {
                        Image(systemName:"arrow.clockwise.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    
                    Text("\(refreshString) \(aireModel.lastRefreshDate.formatted(date: .abbreviated, time: .omitted)) \(aireModel.lastRefreshDate.formatted(date: .omitted, time: .shortened))",
                         comment: "Specifies the last date the model was refreshed")
                        .foregroundColor(.white)
                        .padding(0)

                    Spacer()
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 10, trailing: 0))
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ARCameraView(aireModel: AireModel())
}
