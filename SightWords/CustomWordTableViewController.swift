//
//  TableViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/5/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class CustomWordTableViewController: UITableViewController {

	var customWordsDictionary = [String: [String]]()
	var customWordsSectionTitles = [String]()
	var customWords = [String]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		customWords = ["Apple", "Bear", "Cat", "Dog"]
		self.title = "Custom Word List"
		self.navigationItem.largeTitleDisplayMode = .never
		//let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWord))
		//self.navigationItem.rightBarButtonItem = addButton
		self.navigationItem.leftBarButtonItem = editButtonItem
		
		for customWord in customWords {
			let customWordKey = String(customWord.prefix(1))
			if var customWordValues = customWordsDictionary[customWordKey] {
				customWordValues.append(customWord)
				customWordsDictionary[customWordKey] = customWordValues
			} else {
				customWordsDictionary[customWordKey] = [customWord]
			}
		}
		
		customWordsSectionTitles = [String](customWordsDictionary.keys)
		customWordsSectionTitles = customWordsSectionTitles.sorted(by: { $0 < $1 })
		
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return customWordsSectionTitles.count
    }
	
	/*@objc func addWord() {
		if
		//customWordListTableView.isEditing {
			return
			}
		let name:String = ""
		customWordListData.insert(name, at: 0)
		let indexPath:IndexPath = IndexPath(row: 0, section: 0)
		customWordListTableView.insertRows(at: [indexPath], with: .automatic)
		customWordListTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
		self.performSegue(withIdentifier: "wordDetail", sender: nil)
	}
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		let carKey = customWordsSectionTitles[section]
		if let carValues = customWordsDictionary[carKey] {
			return carValues.count
		}
		
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
		let carKey = customWordsSectionTitles[indexPath.section]
		if let carValues = customWordsDictionary[carKey] {
			cell.textLabel?.text = carValues[indexPath.row]
		}

        return cell
    }

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return customWordsSectionTitles[section]
	}
	
	override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		return customWordsSectionTitles
	}
	
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
