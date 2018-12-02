//
//  DelayIntervalViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/25/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class DelayIntervalViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
	
	var pickerData: [String] = ["1", "2", "3", "4", "5", "10", "20"]
	var selectedInterval: String!
	var masterView:SettingsViewController!
	
	@IBOutlet weak var delayIntervalPickerView: UIPickerView!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.delayIntervalPickerView.delegate = self
		self.delayIntervalPickerView.dataSource = self
		
		// Load the value to be shown in the picker from UserDefaults
		if let data = UserDefaults.standard.string(forKey: "timerInterval") {
			selectedInterval = data
		} else {
			selectedInterval = "1"
		}
		
		// Select the row in the picker that corresponds to the stored value
		if let row = pickerData.firstIndex(of: selectedInterval!){
			delayIntervalPickerView.selectRow(row, inComponent: 0, animated: false)
		}
		
		self.navigationItem.largeTitleDisplayMode = .never
		
    }
    
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerData.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerData[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		selectedInterval = pickerData[row]
		UserDefaults.standard.set(selectedInterval, forKey: "timerInterval")
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		masterView.timerInterval = selectedInterval!
	}

}
