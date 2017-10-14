//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Ariel Scott-Dicker on 2017-10-14.
//  Copyright © 2017 Ariel Scott-Dicker. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
	@IBOutlet var celsiusLabel: UILabel!
	@IBOutlet var textField: UITextField!
	
	@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
		if let text = textField.text, !text.isEmpty {
			celsiusLabel.text = text
		} else {
			celsiusLabel.text = "???"
		}
	}
	
	@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
		textField.resignFirstResponder()
	}
}
