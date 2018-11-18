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
	
	var settingsData:[String] = ["Word Lists","Word Set Size","Delay Interval"]
	var settingsSegueIdentifiers:[String] = ["wordListsSegue", "wordSetSizeSegue", "delayIntervalSegue"]
	
	override func viewDidLoad() {
        super.viewDidLoad()
		settingsTableView.dataSource  = self
		settingsTableView.delegate = self
		self.title = "Settings"
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationItem.largeTitleDisplayMode = .always
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
		else {
		cell.detailTextLabel?.text = "5" // Adds the detail text
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: settingsSegueIdentifiers[indexPath.row], sender: nil)
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
