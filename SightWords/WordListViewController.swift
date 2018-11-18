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
	
	var wordListData:[String] = ["Dolch","Fry","Custom"]
	//var wordListSegueIdentifiers:[String] = ["wordListsDetail", "wordSetSizeDetail", "delayIntervalDetail"]
	
    override func viewDidLoad() {
        super.viewDidLoad()

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
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = wordListTableView.dequeueReusableCell(withIdentifier: "cell")!
		cell.textLabel?.text = wordListData[indexPath.row]
		if(cell.textLabel?.text == "Custom")
		{
			cell.accessoryType = .disclosureIndicator // Adds the little >
		} else {
			let switchView = UISwitch(frame: .zero)
			switchView.setOn(false, animated: true)
			switchView.tag = indexPath.row
			switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
			cell.accessoryView = switchView
		}
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//print("\(data[indexPath.row])")
		self.performSegue(withIdentifier: "customWordsListSegue", sender: nil)
		//self.performSegue(withIdentifier: "carsDetail", sender: nil)
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
