//
//  ViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/4/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var table: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		label.text = "Sight Words"
	}
	
	
	@IBAction func settingsButtonPressed(_ sender: Any) {
		self.performSegue(withIdentifier: "settingsSegue", sender: nil)
	}
	
	@IBAction func playButtonPressed(_ sender: Any) {
		self.performSegue(withIdentifier: "modeSelectSegue", sender: nil)
	}
	
}

