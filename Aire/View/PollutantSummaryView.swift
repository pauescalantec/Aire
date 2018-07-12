//
//  PollutantSummaryView.swift
//  Aire
//
//  Created by Natalia García on 7/10/18.
//  Copyright © 2018 QuimeraVerde. All rights reserved.
//

import Foundation
import UIKit

class PollutantSummaryView: NibView {
	@IBOutlet var pollutantTitleLabel: UILabel!
	@IBOutlet var pollutantIndexLabel: UILabel!
	@IBOutlet var pollutantLevelView: UIView!
	
	func setPollutantSummary(pollutant: Pollutant) {
		pollutantTitleLabel.text = pollutant.title
		pollutantIndexLabel.text = String(pollutant.aqi)
		pollutantLevelView.layer.borderColor = AirQualityUtility.scale[pollutant.aqi].color.cgColor
	}
}
