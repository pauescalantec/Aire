//
//  Coordinate.swift
//  Aire
//
//  Created by Natalia García on 7/5/18.
//  Copyright © 2018 QuimeraVerde. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxRelay

struct Location {
	static let sharedCoordinate = Coordinate()	// Singleton
	static let sharedAddress = Address()		// Singleton

	struct Address {
		let variable = BehaviorRelay<String>(value: "")
		var observable:Observable<String> {
			return variable.asObservable()
		}
        
        func update() {
               let coordinate = sharedCoordinate.variable.value
               let location = coordinateToLocation(coordinate: coordinate)
               lookUp(location: location) { placemark in
                   if let name = placemark?.name {
                       self.variable.accept(name)   // ✅ use .accept, not .value =
                   }
               }
           }

		
		func coordinateToLocation(coordinate: CLLocationCoordinate2D) -> CLLocation{
			return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
		}
		
		private func lookUp(location: CLLocation, completionHandler: @escaping (CLPlacemark?)
			-> Void ) {
			let geocoder = CLGeocoder()
			
			// Look up the location and pass it to the completion handler
			geocoder.reverseGeocodeLocation(location,
											completionHandler: { (placemarks, error) in
												if error == nil {
													let firstLocation = placemarks?[0]
													completionHandler(firstLocation)
												}
												else {
													// An error occurred during geocoding.
													completionHandler(nil)
												}
			})
		}
	}

	class Coordinate {
        let variable = BehaviorRelay<CLLocationCoordinate2D>(value:CLLocationCoordinate2D())
		var isReady: Bool = false
		var observable:Observable<CLLocationCoordinate2D> {
			return variable.asObservable()
		}

        func update(coordinate: CLLocationCoordinate2D) {
            isReady = true
            variable.accept(coordinate)
        }
        
		func isEqual(to: CLLocationCoordinate2D) -> Bool {
			return self.variable.value.latitude.isEqual(to: to.latitude) && self.variable.value.longitude.isEqual(to: to.longitude)
		}
		
		static func areEqual(a: CLLocationCoordinate2D, b: CLLocationCoordinate2D) -> Bool {
			return a.latitude.isEqual(to: b.latitude) && a.longitude.isEqual(to: b.longitude)
		}
	}
}

