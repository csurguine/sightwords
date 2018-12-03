//
//  WordSetSizeViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/26/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class WordSetSizeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	var pickerData: [Int] = [3,4,5,10,15,20,30,40,50]
	var selectedSize: Int!
	var masterView:SettingsViewController!
	
	@IBOutlet weak var wordSetSizePickerView: UIPickerView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        self.wordSetSizePickerView.delegate = self
		self.wordSetSizePickerView.dataSource = self
		
		// Load the value to be shown in the picker from UserDefaults
		selectedSize = UserDefaults.standard.integer(forKey: "wordSetSize")
		
		// Select the row in the picker that corresponds to the stored value
		if let row = pickerData.firstIndex(of: selectedSize!){
			wordSetSizePickerView.selectRow(row, inComponent: 0, animated: false)
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
		return String(pickerData[row])
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		selectedSize = pickerData[row]
		UserDefaults.standard.set(selectedSize, forKey: "wordSetSize")
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		masterView.wordSetSize = selectedSize!
	}

}
