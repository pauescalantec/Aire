//
//  ARCameraView.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI

struct ARCameraView: View {
    @State var aireModel: AireModel
    @ObservedObject var arDelegate = ARDelegate()
    
    var body: some View {
        ZStack {
            ARCameraViewRepresentable(arDelegate: arDelegate)
            
            VStack {
                HStack {
                    GreenGenericButton(buttonAction: {
                        // toggle back to landing view
                        aireModel.showCameraView.toggle()
                    }, buttonText: "Go Back")
                    .padding(25)
                    Spacer()
                }
                
                Spacer()
                
                Text(arDelegate.message)
                    .foregroundColor(Color.primary)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                    .background(Color.secondary)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ARCameraView(aireModel: AireModel())
}
