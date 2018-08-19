//
//  AirQualityReportTest.swift
//  Aire
//
//  Created by Natalia García on 8/17/18.
//  Copyright © 2018 QuimeraVerde. All rights reserved.
//

import Foundation

class AirQualityReportTest: AirQualityReport {
	override init() {
		super.init()
		self.aqi = 50
		self.dominantPollutantID = .pm10
		self.location = "Monterrey, NL"
		self.pollutants = AirQualityReport.pollutantsInit
		self.timestamp = Date()
		
		for (pollutantID, _) in self.pollutants {
			self.pollutants[pollutantID]?.aqi = 5
			self.pollutants[pollutantID]?.count = Int(50 * 1.5)
		}
		self.timestamp = Date()
	}
}
