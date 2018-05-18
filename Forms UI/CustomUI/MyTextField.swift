//
//  MyTextField.swift
//  Forms UI
//
//  Created by Marcos Torres on 5/17/18.
//  Copyright © 2018 HSoft Mobile. All rights reserved.
//

import UIKit

@IBDesignable
class MyTextField: UITextField {

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	func style() -> Void {
		borderStyle = .none
		let border = CALayer()
		let borderWidth = CGFloat(2.0)
		let sidePadding = CGFloat(10.0)
		
		border.borderColor = UIColor(red: 0.398, green: 0.730, blue: 0.414, alpha:1).cgColor
		border.borderWidth = borderWidth
		border.frame = CGRect(x: sidePadding * -1, y: borderWidth, width: bounds.size.width + 2 * sidePadding, height: bounds.size.height - 2 * borderWidth)
		
		self.layer.addSublayer(border)
		self.layer.masksToBounds = false
	}
	
	func applyBorderStyle(_ borderWidth: CGFloat, _ sidePadding: CGFloat, _ color: UIColor) -> Void {
		borderStyle = .none
		
		let borderLayer = CALayer()
		borderLayer.borderColor = color.cgColor
		borderLayer.frame = CGRect(x: sidePadding * -1, y: borderWidth, width: bounds.size.width + 2 * sidePadding, height: bounds.size.height - 2 * borderWidth)
		
		self.layer.addSublayer(borderLayer)
		self.layer.masksToBounds = false
	}
	
	func applyStyle() -> Void {
		borderStyle = .none
		
		let borderLayer = CALayer()
		let borderWidth = CGFloat(2.0)
		let sidePadding = CGFloat(10.0)
		
		
		borderLayer.borderColor = UIColor.cyan.cgColor
		borderLayer.frame = CGRect(x: sidePadding * -1, y: borderWidth, width: bounds.size.width + 2 * sidePadding, height: bounds.size.height - 2 * borderWidth)
		
		self.layer.addSublayer(borderLayer)
		self.layer.masksToBounds = false
	}
}
