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
	
	var birthDatePicker: UIDatePicker!
	
	var placeholderFont: UIFont!
	
	var currentDate: Date!
	var minBirthDate: Date!
	var maxBirthDate: Date!
	var calendar: Calendar!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		currentDate = Date()
		calendar = Calendar.current
		
		placeholderFont = UIFont.systemFont(ofSize: 14.0)
		birthDatePicker = UIDatePicker()
		// configure date picker
		setupDatePickers()
		setupTextFields()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
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
		
		//dateField.setAttributedPlaceholderText("BIRTH DATE")
		dateField.attributedPlaceholder = UIUtils.attributedString(fromText: "BIRTH DATE", withFont: placeholderFont, andColor: UIColor.cyan)
		nameField.setAttributedPlaceholderText("NAME")
		ageField.setAttributedPlaceholderText("AGE")
		addressField.setAttributedPlaceholderText("ADDRESS")
		emailField.setAttributedPlaceholderText("EMAIL")
		phoneField.setAttributedPlaceholderText("PHONE")
		notesField.setAttributedPlaceholderText("NOTES")
	}

	func linkBirthDatePicker(withTextField textField: UITextField) {
		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneSelectingBirthDate))
		toolbar.setItems([doneButton], animated: false)
		
		textField.inputAccessoryView = toolbar
		textField.inputView = birthDatePicker
	}
	
	func setupDatePickers() {
		birthDatePicker.datePickerMode = .date
		
		minBirthDate = calendar.date(byAdding: Calendar.Component.year, value: -3, to: currentDate)
		maxBirthDate = calendar.date(byAdding: Calendar.Component.day, value: 20, to: currentDate)
		
		birthDatePicker.date = currentDate
		birthDatePicker.minimumDate = minBirthDate
		birthDatePicker.maximumDate = maxBirthDate
		
		birthDatePicker.setDate(currentDate, animated: true)
	}
	
	func validateBirthDate() -> Bool {
		let selectedDate = birthDatePicker.date
		let selectedDay = calendar.component(Calendar.Component.day, from: selectedDate)
		
		if selectedDay == 15 {
			return false
		}
		
		return true
	}
	
	@objc func doneSelectingBirthDate() {
		guard validateBirthDate() else {
			return
		}
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateField.text = dateFormatter.string(from: birthDatePicker.date)
		self.view.endEditing(true)
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
		
		linkBirthDatePicker(withTextField: dateField)
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

