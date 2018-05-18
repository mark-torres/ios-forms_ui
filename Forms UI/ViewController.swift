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
// https://littlebitesofcocoa.com/246-uitextfield-b-sides
// https://www.invasivecode.com/weblog/attributed-text-swift/

class ViewController: UIViewController, UITextFieldDelegate {
	
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
		
		setupTextFields()
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
		
		dateField.setAttributedPlaceholderText("BIRTH DATE")
		nameField.setAttributedPlaceholderText("NAME")
		ageField.setAttributedPlaceholderText("AGE")
		addressField.setAttributedPlaceholderText("ADDRESS")
		emailField.setAttributedPlaceholderText("EMAIL")
		phoneField.setAttributedPlaceholderText("PHONE")
		notesField.setAttributedPlaceholderText("NOTES")
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
	
	func setupTextFields() -> Void {
		dateField.delegate = self
		nameField.delegate = self
		ageField.delegate = self
		addressField.delegate = self
		emailField.delegate = self
		phoneField.delegate = self
		notesField.delegate = self
		
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction))
		view.addGestureRecognizer(tapGesture)
	}
	
	@objc func tapGestureAction() {
		view.endEditing(true)
	}
	
	// MARK: - Text field delegate
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		switch textField {
		case nameField:
			ageField.becomeFirstResponder()
			break
		case ageField:
			addressField.becomeFirstResponder()
			break
		case addressField:
			emailField.becomeFirstResponder()
			break
		case emailField:
			phoneField.becomeFirstResponder()
			break
		case phoneField:
			notesField.becomeFirstResponder()
			break
		default:
			return true
		}
		return true
	}
}

