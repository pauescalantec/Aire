//
//  RKViewContainer.swift
//  AireApp
//
//  Created by Paulina Escalante on 9/6/25.
//


import SwiftUI
import RealityKit

/// This view is the RealityKit representation of the AR view
struct RKCameraViewContainer: UIViewRepresentable {
    @State var modelName: String = "ball_baseball_realistic" // Testing model
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // RealityKit's native AR configuration
        arView.automaticallyConfigureSession = true
        arView.renderOptions = [.disablePersonOcclusion, .disableDepthOfField, .disableMotionBlur]
        
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {
        // Load model and tell reality kit to place it
        let anchorEntity = AnchorEntity(plane: .horizontal)
        guard let modelEntity = try? Entity.loadModel(named: modelName) else { return }
        
        // Adds light and shadows to the model
        modelEntity.addChild(shadow())
        anchorEntity.addChild(modelEntity)
        // For more than one anchor
        uiView.scene.anchors.append(anchorEntity)
    }
    
    private func shadow() -> Entity {
        let lightShineTarget = SIMD3<Float>(0, 0, 0)
        let lightPosition: SIMD3<Float> = SIMD3<Float>(0.727_9, 2, 0.0 ) // corresponds to 70 degree angle
        let distance: Float = 18.0
        let shadowCastingLight = DirectionalLight()
        shadowCastingLight.name = "shadowCastingLight"
        shadowCastingLight.light = DirectionalLightComponent(color: .white, intensity: 2_145.707_8, isRealWorldProxy: true)
        shadowCastingLight.shadow = DirectionalLightComponent.Shadow(maximumDistance: distance)
        shadowCastingLight.position = lightPosition
        shadowCastingLight.look(at: lightShineTarget, from: shadowCastingLight.position, relativeTo: nil)
        return shadowCastingLight
    }
}

struct RKCameraViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        RKCameraViewContainer(modelName:"ball_baseball_realistic")
    }
}
