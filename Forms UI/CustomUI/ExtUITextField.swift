//
//  ExtUITextField.swift
//  Forms UI
//
//  Created by Marcos Torres on 5/18/18.
//  Copyright © 2018 HSoft Mobile. All rights reserved.
//

import UIKit

extension UITextField {
	
	func applyBorderedStyle(_ borderWidth: CGFloat, _ sidePadding: CGFloat, _ color: UIColor) -> Void {
		borderStyle = .none
		
		let borderLayer = CALayer()
		borderLayer.borderColor = color.cgColor
		borderLayer.borderWidth = borderWidth
		borderLayer.frame = CGRect(x: sidePadding * -1, y: borderWidth, width: bounds.size.width + 2 * sidePadding, height: bounds.size.height - 2 * borderWidth)
		
		self.layer.addSublayer(borderLayer)
		self.layer.masksToBounds = false
	}
	
}
