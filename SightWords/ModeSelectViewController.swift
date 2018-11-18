//
//  ModeSelectViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/14/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class ModeSelectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var modeSelectTableView: UITableView!
	
	var modesData:[String] = ["Flashcards","Word Matching"]
	var modesSegueIdentifiers:[String] = ["flashcardsSegue", "wordMatchingSegue"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		modeSelectTableView.dataSource = self
		modeSelectTableView.delegate = self
		
	self.navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationItem.largeTitleDisplayMode = .always
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return modesData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell:UITableViewCell = modeSelectTableView.dequeueReusableCell(withIdentifier: "cell")!
		
		cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
		
		cell.textLabel?.text = modesData[indexPath.row] // Adds the main text
		cell.accessoryType = .disclosureIndicator // Adds the little >
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: modesSegueIdentifiers[indexPath.row], sender: nil)
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
