//
//  WordListViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/4/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class WordListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	
	@IBOutlet weak var wordListTableView: UITableView!
	
	var customWordsList:[String] = []
	var wordListData:[String] = ["Dolch","Fry","Custom"]
	//var wordListSegueIdentifiers:[String] = ["wordListsDetail", "wordSetSizeDetail", "delayIntervalDetail"]
	let dolchWords = ["a",
					  "and",
					  "away",
					  "big",
					  "blue",
					  "can",
					  "come",
					  "down",
					  "find",
					  "for",
					  "funny",
					  "go",
					  "help",
					  "here",
					  "I",
					  "in",
					  "is",
					  "it",
					  "jump",
					  "little",
					  "look",
					  "make",
					  "me",
					  "my",
					  "not",
					  "one",
					  "play",
					  "red",
					  "run",
					  "said",
					  "see",
					  "the",
					  "three",
					  "to",
					  "two",
					  "up",
					  "we",
					  "where",
					  "yellow",
					  "you"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		load()
        wordListTableView.dataSource = self
		wordListTableView.delegate = self
		self.title = "Word Lists"
		self.navigationItem.largeTitleDisplayMode = .never
    }
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return wordListData.count
	}
	
	@objc func switchChanged(_ sender:UISwitch!){
		print("table row switch changed \(sender.tag)")
		print("The switch is \(sender.isOn ? "ON" : "OFF")")
	}
	
	@objc func toggleDolchSightWords(_ sender:UISwitch!){
		print("Toggling Dolch Sight Words")
		if(sender.isOn == true) {
			self.customWordsList = Array(Set(self.customWordsList + dolchWords)).sorted()
		} else {
			self.customWordsList = Set(self.customWordsList).symmetricDifference(Set(dolchWords))
		}
	}
	
	@objc func toggleFrySightWords(_ sender:UISwitch!){
		print("Toggling Fry Sight Words")
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = wordListTableView.dequeueReusableCell(withIdentifier: "cell")!
		cell.textLabel?.text = wordListData[indexPath.row]
		if(cell.textLabel?.text == "Custom")
		{
			cell.accessoryType = .disclosureIndicator // Adds the little >
		} else if(cell.textLabel?.text == "Dolch") {
			let switchView = UISwitch(frame: .zero)
			switchView.setOn(false, animated: true)
			switchView.tag = indexPath.row
			switchView.addTarget(self, action: #selector(self.toggleDolchSightWords(_:)), for: .valueChanged)
			cell.accessoryView = switchView
		} else if(cell.textLabel?.text == "Fry") {
			let switchView = UISwitch(frame: .zero)
			switchView.setOn(false, animated: true)
			switchView.tag = indexPath.row
			switchView.addTarget(self, action: #selector(self.toggleFrySightWords(_:)), for: .valueChanged)
			cell.accessoryView = switchView
		}
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "customWordsListSegue", sender: nil)
	}
	
	func load() {
		if let loadedData = UserDefaults.standard.value(forKey: "words") as? [String] {
			customWordsList = loadedData
		}
		
	}

}
