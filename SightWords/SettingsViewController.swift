//
//  SettingsViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/4/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var settingsTableView: UITableView!
	
	var settingsData:[String] = ["Word Lists","Word Set Size","Delay Interval (seconds)"]
	var settingsSegueIdentifiers:[String] = ["wordListsSegue", "wordSetSizeSegue", "delayIntervalSegue"]
	var timerInterval:Int = 0
	var wordSetSize:Int = 0
	
	override func viewDidLoad() {
        super.viewDidLoad()
		settingsTableView.dataSource  = self
		settingsTableView.delegate = self
		self.title = "Settings"
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationItem.largeTitleDisplayMode = .always
		load()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		settingsTableView.reloadData()
	}
    
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return settingsData.count
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell:UITableViewCell = settingsTableView.dequeueReusableCell(withIdentifier: "cell")!
		
		cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
		
		cell.textLabel?.text = settingsData[indexPath.row] // Adds the main text
		cell.accessoryType = .disclosureIndicator // Adds the little >
		if(cell.textLabel?.text == "Word Lists") {
			
		}
		else if(cell.textLabel?.text == "Delay Interval (seconds)"){
			cell.detailTextLabel?.text = String(timerInterval)
		}
		
		else if(cell.textLabel?.text == "Word Set Size"){
			cell.detailTextLabel?.text = String(wordSetSize)
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: settingsSegueIdentifiers[indexPath.row], sender: nil)
	}
	
	func load() {
		timerInterval = UserDefaults.standard.integer(forKey: "timerInterval")
		wordSetSize = UserDefaults.standard.integer(forKey: "wordSetSize")
		settingsTableView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "delayIntervalSegue" {
			let delayIntervalView:DelayIntervalViewController = segue.destination as! DelayIntervalViewController
			delayIntervalView.masterView = self
		} else if segue.identifier == "wordSetSizeSegue" {
			let wordSetSizeView:WordSetSizeViewController = segue.destination as! WordSetSizeViewController
			wordSetSizeView.masterView = self
		}
	}

}
