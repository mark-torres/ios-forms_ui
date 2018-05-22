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

// Keyboard show/hide
// https://www.youtube.com/watch?v=xVZubAMFuIU

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
	
	@IBOutlet weak var dateField: UITextField!
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var ageField: UITextField!
	@IBOutlet weak var addressField: UITextField!
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var phoneField: UITextField!
	@IBOutlet weak var notesField: UITextField!
	
	@IBOutlet weak var saveButton: UIButton!
	
	@IBOutlet var reservationDatePicker: UIPickerView!
	
	var resMonths: [ReservationMonth] = []
	
	var birthDatePicker: UIDatePicker!
	
	var placeholderFont: UIFont!
	
	var currentDate: Date!
	var minBirthDate: Date!
	var maxBirthDate: Date!
	var calendar: Calendar!
	
	@IBOutlet weak var formScrollView: UIScrollView!
	
	// MARK: -
	
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
		print("viewDidLayoutSubviews")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		addKBObservers()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		removeKBObservers()
	}
	
	// MARK: -
	
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
	
	func linkResDatePicker(withTextField textField: UITextField) -> Void {
		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneSelectingResDate))
		toolbar.setItems([doneButton], animated: false)
		
		textField.inputAccessoryView = toolbar
		textField.inputView = reservationDatePicker
	}
	
	func setupDatePickers() {
		birthDatePicker.datePickerMode = .date
		
		minBirthDate = calendar.date(byAdding: Calendar.Component.year, value: -3, to: currentDate)
		maxBirthDate = calendar.date(byAdding: Calendar.Component.day, value: 20, to: currentDate)
		
		birthDatePicker.date = currentDate
		birthDatePicker.minimumDate = minBirthDate
		birthDatePicker.maximumDate = maxBirthDate
		
		birthDatePicker.setDate(currentDate, animated: true)
		
		reservationDatePicker.translatesAutoresizingMaskIntoConstraints = false
		reservationDatePicker.delegate = self
		reservationDatePicker.dataSource = self
		
		let may = ReservationMonth("May 2018")
		may.dates.append( ReservationDay("Sun 20th", "2018-05-20") )
		may.dates.append( ReservationDay("Mon 21st", "2018-05-21") )
		may.dates.append( ReservationDay("Tue 22nd", "2018-05-22") )
		may.dates.append( ReservationDay("Wed 23rd", "2018-05-23") )
		may.dates.append( ReservationDay("Thu 24th", "2018-05-24") )
		may.dates.append( ReservationDay("Fri 25th", "2018-05-25") )
		may.dates.append( ReservationDay("Sat 26th", "2018-05-26") )
		may.dates.append( ReservationDay("Sun 27th", "2018-05-27") )
		may.dates.append( ReservationDay("Mon 28th", "2018-05-28") )
		may.dates.append( ReservationDay("Tue 29th", "2018-05-29") )
		may.dates.append( ReservationDay("Wed 30th", "2018-05-30") )
		may.dates.append( ReservationDay("Thu 31st", "2018-05-31") )
		
		let jun = ReservationMonth("Jun 2018")
		jun.dates.append( ReservationDay("Fri 1st", "2018-06-01") )
		jun.dates.append( ReservationDay("Sat 2nd", "2018-06-02") )
		jun.dates.append( ReservationDay("Sun 3rd", "2018-06-03") )
		jun.dates.append( ReservationDay("Mon 4th", "2018-06-04") )
		jun.dates.append( ReservationDay("Tue 5th", "2018-06-05") )
		jun.dates.append( ReservationDay("Wed 6th", "2018-06-06") )
		jun.dates.append( ReservationDay("Thu 7th", "2018-06-07") )
		jun.dates.append( ReservationDay("Fri 8th", "2018-06-08") )
		jun.dates.append( ReservationDay("Sat 9th", "2018-06-09") )
		jun.dates.append( ReservationDay("Sun 10th", "2018-06-10") )
		jun.dates.append( ReservationDay("Mon 11th", "2018-06-11") )
		jun.dates.append( ReservationDay("Tue 12th", "2018-06-12") )
		jun.dates.append( ReservationDay("Wed 13th", "2018-06-13") )
		jun.dates.append( ReservationDay("Thu 14th", "2018-06-14") )
		jun.dates.append( ReservationDay("Fri 15th", "2018-06-15") )
		jun.dates.append( ReservationDay("Sat 16th", "2018-06-16") )
		jun.dates.append( ReservationDay("Sun 17th", "2018-06-17") )
		jun.dates.append( ReservationDay("Mon 18th", "2018-06-18") )
		jun.dates.append( ReservationDay("Tue 19th", "2018-06-19") )
		jun.dates.append( ReservationDay("Wed 20th", "2018-06-20") )
		jun.dates.append( ReservationDay("Thu 21st", "2018-06-21") )
		jun.dates.append( ReservationDay("Fri 22nd", "2018-06-22") )
		jun.dates.append( ReservationDay("Sat 23rd", "2018-06-23") )
		jun.dates.append( ReservationDay("Sun 24th", "2018-06-24") )
		jun.dates.append( ReservationDay("Mon 25th", "2018-06-25") )
		jun.dates.append( ReservationDay("Tue 26th", "2018-06-26") )
		jun.dates.append( ReservationDay("Wed 27th", "2018-06-27") )
		jun.dates.append( ReservationDay("Thu 28th", "2018-06-28") )
		jun.dates.append( ReservationDay("Fri 29th", "2018-06-29") )
		jun.dates.append( ReservationDay("Sat 30th", "2018-06-30") )
		
		let jul = ReservationMonth("Jul 2018")
		jul.dates.append( ReservationDay("Sun 1st", "2018-07-01") )
		jul.dates.append( ReservationDay("Mon 2nd", "2018-07-02") )
		jul.dates.append( ReservationDay("Tue 3rd", "2018-07-03") )
		jul.dates.append( ReservationDay("Wed 4th", "2018-07-04") )
		jul.dates.append( ReservationDay("Thu 5th", "2018-07-05") )
		jul.dates.append( ReservationDay("Fri 6th", "2018-07-06") )
		jul.dates.append( ReservationDay("Sat 7th", "2018-07-07") )
		jul.dates.append( ReservationDay("Sun 8th", "2018-07-08") )
		jul.dates.append( ReservationDay("Mon 9th", "2018-07-09") )
		jul.dates.append( ReservationDay("Tue 10th", "2018-07-10") )
		jul.dates.append( ReservationDay("Wed 11th", "2018-07-11") )
		jul.dates.append( ReservationDay("Thu 12th", "2018-07-12") )
		jul.dates.append( ReservationDay("Fri 13th", "2018-07-13") )
		jul.dates.append( ReservationDay("Sat 14th", "2018-07-14") )
		jul.dates.append( ReservationDay("Sun 15th", "2018-07-15") )
		jul.dates.append( ReservationDay("Mon 16th", "2018-07-16") )
		jul.dates.append( ReservationDay("Tue 17th", "2018-07-17") )
		jul.dates.append( ReservationDay("Wed 18th", "2018-07-18") )
		jul.dates.append( ReservationDay("Thu 19th", "2018-07-19") )
		jul.dates.append( ReservationDay("Fri 20th", "2018-07-20") )
		jul.dates.append( ReservationDay("Sat 21st", "2018-07-21") )
		jul.dates.append( ReservationDay("Sun 22nd", "2018-07-22") )
		jul.dates.append( ReservationDay("Mon 23rd", "2018-07-23") )
		jul.dates.append( ReservationDay("Tue 24th", "2018-07-24") )
		jul.dates.append( ReservationDay("Wed 25th", "2018-07-25") )
		jul.dates.append( ReservationDay("Thu 26th", "2018-07-26") )
		jul.dates.append( ReservationDay("Fri 27th", "2018-07-27") )
		jul.dates.append( ReservationDay("Sat 28th", "2018-07-28") )
		jul.dates.append( ReservationDay("Sun 29th", "2018-07-29") )
		jul.dates.append( ReservationDay("Mon 30th", "2018-07-30") )
		jul.dates.append( ReservationDay("Tue 31st", "2018-07-31") )
		
		let aug = ReservationMonth("Aug 2018")
		aug.dates.append( ReservationDay("Wed 1st", "2018-08-01") )
		aug.dates.append( ReservationDay("Thu 2nd", "2018-08-02") )
		aug.dates.append( ReservationDay("Fri 3rd", "2018-08-03") )
		aug.dates.append( ReservationDay("Sat 4th", "2018-08-04") )
		aug.dates.append( ReservationDay("Sun 5th", "2018-08-05") )
		aug.dates.append( ReservationDay("Mon 6th", "2018-08-06") )
		aug.dates.append( ReservationDay("Tue 7th", "2018-08-07") )
		aug.dates.append( ReservationDay("Wed 8th", "2018-08-08") )
		aug.dates.append( ReservationDay("Thu 9th", "2018-08-09") )
		aug.dates.append( ReservationDay("Fri 10th", "2018-08-10") )
		aug.dates.append( ReservationDay("Sat 11th", "2018-08-11") )
		aug.dates.append( ReservationDay("Sun 12th", "2018-08-12") )
		aug.dates.append( ReservationDay("Mon 13th", "2018-08-13") )
		aug.dates.append( ReservationDay("Tue 14th", "2018-08-14") )
		aug.dates.append( ReservationDay("Wed 15th", "2018-08-15") )
		
		resMonths.append(may)
		resMonths.append(jun)
		resMonths.append(jul)
		resMonths.append(aug)
		
		reservationDatePicker.reloadComponent(0)
	}
	
	func validateBirthDate() -> Bool {
		let selectedDate = birthDatePicker.date
		let selectedDay = calendar.component(Calendar.Component.day, from: selectedDate)
		
		if selectedDay == 15 {
			return false
		}
		
		return true
	}
	
	@objc func doneSelectingResDate() {
		let selectedMonth = reservationDatePicker.selectedRow(inComponent: 0)
		let selectedDate = resMonths[selectedMonth].dates[ reservationDatePicker.selectedRow(inComponent: 1) ]
		print(selectedDate.dateString)
		notesField.text = selectedDate.dateString
		self.view.endEditing(true)
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
		
		linkResDatePicker(withTextField: notesField)
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
	
	// MARK: - Picker view delegate
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 2
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		if component == 0 {
			return resMonths.count
		} else {
			let selectedMonth = reservationDatePicker.selectedRow(inComponent: 0)
			return resMonths[selectedMonth].dates.count
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		if component == 0 {
			return resMonths[row].title
		} else {
			let selectedMonth = reservationDatePicker.selectedRow(inComponent: 0)
			return resMonths[selectedMonth].dates[row].title
		}
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		if component == 0 {
			reservationDatePicker.reloadComponent(1)
			reservationDatePicker.selectRow(0, inComponent: 1, animated: true)
		}
	}
	
	// MARK: - Keyboard show/hide observers
	
	func addKBObservers() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow , object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide , object: nil)
	}
	
	func removeKBObservers() {
		NotificationCenter.default.removeObserver(self)
	}
	
	func adjustInsetForKeyboard(_ show: Bool, notification: Notification) {
		guard let userInfo = notification.userInfo,
			let keyboardFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
				return
		}
		let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
		formScrollView.contentInset.bottom += adjustmentHeight
		formScrollView.scrollIndicatorInsets.bottom += adjustmentHeight
	}
	
	@objc func keyboardWillShow(_ notification: Notification) {
		adjustInsetForKeyboard(true, notification: notification)
	}
	
	@objc func keyboardWillHide(_ notification: Notification) {
		adjustInsetForKeyboard(false, notification: notification)
	}
}

