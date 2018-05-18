//
//  UIUtils.swift
//  Forms UI
//
//  Created by Marcos Torres on 5/18/18.
//  Copyright © 2018 HSoft Mobile. All rights reserved.
//

import Foundation
import UIKit

class UIUtils {
	
	class func attributedString(fromText text: String, withFont font: UIFont, andColor color: UIColor) -> NSAttributedString {
		let attributes: [NSAttributedStringKey : Any] = [
			NSAttributedStringKey.font: font,
			NSAttributedStringKey.foregroundColor: color
		]
		return NSAttributedString(string: text, attributes: attributes)
	}
	
}
