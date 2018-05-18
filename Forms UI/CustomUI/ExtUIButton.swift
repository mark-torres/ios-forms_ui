//
//  ExtUIButton.swift
//  Forms UI
//
//  Created by Marcos Torres on 5/17/18.
//  Copyright © 2018 HSoft Mobile. All rights reserved.
//

import UIKit

// https://littlebitesofcocoa.com/119-ibinspectable-ibdesignable

extension UIButton {
	
	@IBInspectable var borderWidth: CGFloat {
		get { return layer.borderWidth }
		set { layer.borderWidth = borderWidth }
	}
	
	@IBInspectable var cornerRadius: CGFloat {
		get { return layer.cornerRadius }
		set { layer.cornerRadius = cornerRadius }
	}
	
	@IBInspectable var borderColor: CGColor {
		get { return layer.borderColor! }
		set { layer.borderColor = borderColor }
	}
	
}
