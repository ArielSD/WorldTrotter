//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Ariel Scott-Dicker on 2017-10-14.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
	@IBOutlet var celsiusLabel: UILabel!
	@IBOutlet var textField: UITextField!
	
	var fahrenheitValue: Measurement<UnitTemperature>? {
		didSet {
			updateCelsiusLabel()
		}
	}
	
	var celsiusValue: Measurement<UnitTemperature>? {
		if let fahrenheitValue = fahrenheitValue {
			return fahrenheitValue.converted(to: .celsius)
		} else {
			return nil
		}
	}
	
	let numberFormatter: NumberFormatter = {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .decimal
		numberFormatter.minimumFractionDigits = 0
		numberFormatter.maximumFractionDigits = 1
		return numberFormatter
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		updateCelsiusLabel()
	}
	
	@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
		if let text = textField.text, let value = Double(text) {
			fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
		} else {
			fahrenheitValue = nil
		}
	}
	
	@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
		textField.resignFirstResponder()
	}
	
	func updateCelsiusLabel() {
		if let celsiusValue = celsiusValue {
			celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
		} else {
			celsiusLabel.text = "???"
		}
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
		let replacementTextHasDecimalSeparator = string.range(of: ".")
		
		if string.rangeOfCharacter(from: CharacterSet.letters) != nil {
			return false
		}
		
		if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
			return false
		} else {
			return true
		}
	}
}
