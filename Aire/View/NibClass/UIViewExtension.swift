//
//  UIViewExtension.swift
//  Aire
//
//  Created by Natalia García on 7/10/18.
//  Copyright © 2018 QuimeraVerde. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
	/** Loads instance from nib with the same name. */
	func loadNib() -> UIView {
		let bundle = Bundle(for: type(of: self))
		let nibName = type(of: self).description().components(separatedBy: ".").last!
		let nib = UINib(nibName: nibName, bundle: bundle)
		return nib.instantiate(withOwner: self, options: nil).first as! UIView
	}
	
	@IBInspectable public var cornerRadius: CGFloat {
		get { return layer.cornerRadius }
		set { layer.cornerRadius = newValue }
	}
}
