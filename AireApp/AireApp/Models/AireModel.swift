//
//  AireModel.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import Foundation

@Observable
public class AireModel {
    var showCameraView: Bool
    var pollutants: [Pollutant]
    
    init() {
        self.showCameraView = false
        self.pollutants = [Pollutant]()
    }
}
