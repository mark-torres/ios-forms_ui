//
//  ViewController.swift
//  Forms UI
//
//  Created by Marcos Torres on 5/17/18.
//  Copyright © 2018 HSoft Mobile. All rights reserved.
//

import UIKit

// https://www.youtube.com/watch?v=QBuYmP2p3AY
// https://www.youtube.com/watch?v=jY9t5rX8wHE
// https://www.youtube.com/watch?v=yWQq_5oU4Pc

class ViewController: UIViewController {
	
	@IBOutlet weak var dateField: UITextField!
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var ageField: UITextField!
	@IBOutlet weak var addressField: UITextField!
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var phoneField: UITextField!
	@IBOutlet weak var notesField: UITextField!
	
	@IBOutlet weak var saveButton: UIButton!
	
	var datePicker: UIDatePicker!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
		
		datePicker = UIDatePicker()
		// configure date picker
	}
	
	override func viewDidLayoutSubviews() {
		styleFields()
	}
	
	func styleFields() {
		let borderWidth = CGFloat(2.0)
		let sidePadding = CGFloat(10.0)
		let borderColor = UIColor.white
		
		let buttonCornerRadius = CGFloat(10.0)
		
		saveButton.makeRoundCorners(buttonCornerRadius)
		
		dateField.applyBorderedStyle(borderWidth, sidePadding, borderColor)
		nameField.applyBorderedStyle(borderWidth, sidePadding, borderColor)
		ageField.applyBorderedStyle(borderWidth, sidePadding, borderColor)
		addressField.applyBorderedStyle(borderWidth, sidePadding, borderColor)
		emailField.applyBorderedStyle(borderWidth, sidePadding, borderColor)
		phoneField.applyBorderedStyle(borderWidth, sidePadding, borderColor)
		notesField.applyBorderedStyle(borderWidth, sidePadding, borderColor)
	}

	func addDatePicker(to textField: UITextField) {
		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
		toolbar.setItems([doneButton], animated: false)
		
		textField.inputAccessoryView = toolbar
		textField.inputView = datePicker
		
		datePicker.datePickerMode = .date
	}
}

