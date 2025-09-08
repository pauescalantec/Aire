//
//  AirQualityAPI.swift
//  AireApp
//
//  Created by Natalia García on 7/2/18.
//  Copyright © 2018 Natalia García. All rights reserved.
//

import CoreLocation
import Foundation

protocol AirQualityAPI {
    func report(coordinate: CLLocationCoordinate2D) async throws -> AirQualityReport
}

class DefaultAirQualityAPI: AirQualityAPI {
    static let shared = DefaultAirQualityAPI() // Singleton
    
    private init() {} // Private initializer for singleton
    
    func report(coordinate: CLLocationCoordinate2D) async throws -> AirQualityReport {
        let escapedCoordinates = "\(coordinate.latitude);\(coordinate.longitude)"
        guard let url = URL(string: "https://api.waqi.info/feed/geo:\(escapedCoordinates)/?token=\(AQToken)") else {
            throw apiError("Can't create url")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              200...299 ~= httpResponse.statusCode else {
            throw apiError("Invalid response from server")
        }
        
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let jsonData = json["data"] as? [String: Any] else {
            throw apiError("Error parsing JSON response")
        }
        
        return try AirQualityReport.parseJSON(jsonData as NSDictionary)
    }
}
