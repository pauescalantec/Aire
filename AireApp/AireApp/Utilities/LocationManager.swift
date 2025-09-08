//
//  LocationManager.swift
//  AireApp
//
//  Created by Paulina Escalante on 9/7/25.
//

import Foundation
import CoreLocation

protocol AireModelLocationDelegate: AnyObject {
    func locationDidUpdate(_ coordinate: CLLocationCoordinate2D)
}

class LocationManager: NSObject {
    private let locationManager = CLLocationManager()
    weak var delegate: AireModelLocationDelegate?

    var authorizationStatus: CLAuthorizationStatus {
        return locationManager.authorizationStatus
    }
    
    func requestWhenInUseAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    init(delegate: AireModelLocationDelegate) {
        self.delegate = delegate
        super.init()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation( )
    }
    
    func requestLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        case .denied, .restricted:
            // TODO: Error handling, add a default
            print("Location access denied")
        @unknown default:
            break
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        delegate?.locationDidUpdate(location.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // TODO: Error handling, add a default
        print("Location error: \(error.localizedDescription)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.requestLocation()
        }
    }
}
