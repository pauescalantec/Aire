//
//  ARCameraViewRepresentable.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI
import ARKit

/// This view is the ARKit equivalent of the camera app
/// Can be swapped out with the reality kit one
/// Ideally this is deprecated
@available(*, deprecated, message: "Use RKCameraView instead")
struct ARCameraViewContainer: UIViewRepresentable {

    let arDelegate:ARDelegate
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARSCNView(frame: .zero)
        arDelegate.setARView(arView)
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }

}

struct ARCameraViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        ARCameraViewContainer(arDelegate: ARDelegate())
    }
}
