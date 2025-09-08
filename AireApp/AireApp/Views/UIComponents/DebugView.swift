//
//  DebugView.swift
//  AireApp
//
//  Created by Paulina Escalante on 9/7/25.
//

//
//  GreenGenericButton.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import SwiftUI

struct DebugView: View {
    @State var aireModel: AireModel
    
    var body: some View {
        VStack {
            Text("Let's Debug")
            Text("Location: \(aireModel.userLocation.debugDescription)")
            Text("Pollutants: \(aireModel.pollutants.debugDescription)")
        }
        .background(Color.quimeraGreen)
    }
}

#Preview {
    DebugView(aireModel: AireModel())
}
