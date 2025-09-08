//
//  AireModel.swift
//  AireApp
//
//  Created by Paulina Escalante on 8/24/25.
//

import Foundation
import CoreLocation

@Observable
public class AireModel: AireModelLocationDelegate {
    var showCameraView: Bool
    var pollutants: Dictionary<PollutantIdentifier, Pollutant>
    var userLocation: CLLocationCoordinate2D?
    var locationForAPI: CLLocationCoordinate2D?
    var isLoadingLocation: Bool
    
    // UI elements
    var lastRefreshDate : Date = .now
    
    private var locationManager: LocationManager?
    private var airQualityAPI: AirQualityAPI?
    
    init() {
        self.showCameraView = false
        self.pollutants = [PollutantIdentifier: Pollutant]()
        self.userLocation = nil
        self.isLoadingLocation = false
        
        // First thing we do is check the location access
        self.initializeLocationServices()
    }
    
    func fetchAirQuality() {
        guard let userLocation = self.userLocation else { return }
        fetchAirQuality(location: userLocation, finished: {})
    }
    
    func fetchAirQuality(location: CLLocationCoordinate2D, finished: @escaping () -> Void) {
        Task { @MainActor in
            do {
                let report = try await DefaultAirQualityAPI.shared.report(coordinate: location)
                // For debugging purposes
                // TODO: Store entire report
                pollutants = report.pollutants
                finished()
            } catch {
                // TODO: Fail gracefully
                print("Failed to fetch air quality report: \(error)")
            }
        }
    }
    
    func refreshAPI() {
        // TODO: Use default if not available
        guard let locationForAPI = self.locationForAPI else { return }
        fetchAirQuality(location: locationForAPI, finished: { [weak self] in
            // Once done refreshing update Date
            self?.lastRefreshDate = .now
        })
    }
    
    func initializeLocationServices() {
        locationManager = LocationManager(delegate: self)
        checkLocationAuthorization()
        
        // Also request location on launch
        requestLocation()
    }
    
    func requestLocation() {
        isLoadingLocation = true
        locationManager?.requestLocation()
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            // Request authorization when not determined
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            // TODO: Show an alert that experience will not work as well
            print("Location access denied or restricted")
        case .authorizedWhenInUse, .authorizedAlways:
            // Already authorized, no action needed
            break
        @unknown default:
            break
        }
    }
    
    // MARK: - AireModelLocationDelegate
    func locationDidUpdate(_ coordinate: CLLocationCoordinate2D) {
        userLocation = coordinate
        // For now this updates at the same time as the user location but in the future, map location takes precedence
        // TODO: Cleanup location logic
        locationForAPI = coordinate
        isLoadingLocation = false
    }
}
