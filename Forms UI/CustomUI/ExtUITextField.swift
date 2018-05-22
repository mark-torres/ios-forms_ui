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
		
		self.layer.borderColor = color.cgColor
		self.layer.borderWidth = CGFloat(1.0)
		
		let horizontalPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: sidePadding, height: self.bounds.size.height) )
		self.leftViewMode = .always
		self.rightViewMode = .always
		self.leftView = horizontalPaddingView
		self.rightView = horizontalPaddingView
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
