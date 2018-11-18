//
//  CustomWordViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/4/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class CustomWordViewController: UIViewController {
	@IBOutlet weak var textField: UITextField!
	var text:String = ""
	var masterView:CustomWordListViewController!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		textField.text = text
		textField.becomeFirstResponder()
		//textField.clearButtonMode = UITextField.ViewMode.always
		//self.navigationItem.largeTitleDisplayMode = .never
		//let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
		//self.navigationItem.rightBarButtonItem = saveButton
    }
	
	func setText(t:String) {
		text = t
		if isViewLoaded {
			textField.text = t
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		textField.becomeFirstResponder()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		masterView.newRowText = textField.text!
		textField.resignFirstResponder()
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
