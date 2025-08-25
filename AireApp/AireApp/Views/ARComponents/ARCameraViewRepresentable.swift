//
//  ARCameraViewRepresentable.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI
import ARKit

struct ARCameraViewRepresentable: UIViewRepresentable {
    let arDelegate:ARDelegate
    
    func makeUIView(context: Context) -> some UIView {
        let arView = ARSCNView(frame: .zero)
        arDelegate.setARView(arView)
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct ARViewRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ARCameraViewRepresentable(arDelegate: ARDelegate())
    }
}
