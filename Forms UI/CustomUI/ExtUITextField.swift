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
		borderLayer.borderWidth = CGFloat(1.0)
		borderLayer.frame = CGRect(x: sidePadding * -1, y: 0.0, width: bounds.size.width + 2 * sidePadding, height: bounds.size.height)
		
		self.layer.addSublayer(borderLayer)
		self.layer.masksToBounds = false
	}
	
	func setAttributedPlaceholderText(_ text: String) -> Void {
		let font = UIFont.systemFont(ofSize: 14.0)
		
		let attributes: [NSAttributedStringKey : Any] = [
			NSAttributedStringKey.font: font,
			NSAttributedStringKey.foregroundColor: UIColor.yellow
		]
		
		let attrString = NSAttributedString(string: text, attributes: attributes)
		attributedPlaceholder = attrString
	}
	
}
