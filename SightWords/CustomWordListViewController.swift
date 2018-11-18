//
//  CustomWordListViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/4/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

class CustomWordListViewController:
	UIViewController
	,UITableViewDataSource
	,UITableViewDelegate
{

	

	@IBOutlet weak var bottomBarButtonItem: UIBarButtonItem!
	@IBOutlet weak var customWordListTableView: UITableView!
	//var customWordsList:[SightWord] = []
	//var customWordsList:[(key: String, word:String, phonetic:String)] = []
	var customWordsList:[String] = []
	var selectedRow:Int = -1
	var newRowText:String = ""
	var fileURL:URL!
	
    override func viewDidLoad() {
		self.navigationController?.setToolbarHidden(false, animated: true)
        super.viewDidLoad()

		customWordListTableView.dataSource = self
		customWordListTableView.delegate = self
		
		self.title = "Custom Words"
		self.navigationController?.navigationBar.prefersLargeTitles = true
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWord)) // Button to add new notes
		self.navigationItem.rightBarButtonItem = editButtonItem // Edit button will be on the right side of the nav bar
		self.bottomBarButtonItem = addButton // Add button will be at the bottom
		
		/*let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
		fileURL = baseURL.appendingPathComponent("words.txt")*/
		
		load()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.navigationController?.setToolbarHidden(false, animated: true)
		super.viewWillAppear(animated)
		if selectedRow == -1 {
			return
		}
		//let sightWord = SightWord(word: newRowText, phonetic: newRowText)
		//customWordsList.insert(sightWord, at: 0)
		//customWordsList.insert((key: newRowText, word: newRowText, phonetic: "h-e-l-o"), at: 0)
		customWordsList[selectedRow] = newRowText
		if newRowText == "" { // If the row created by the detail view is blank, don't add to the list
			customWordsList.remove(at: selectedRow)
		}
		customWordListTableView.reloadData()
		save()
	}

	@objc func addWord() {
		if customWordListTableView.isEditing {
			return
		}
		//let w:String = ""
		let w:String = "Item \(customWordsList.count + 1)" // Initialize the new word to blank
		//let w:String = "" // Initialize the new word to blank
		//let p:String = "h-e-l-o"
		//let sightWord = SightWord(word: w, phonetic: w)
		//customWordsList.insert(sightWord, at: 0)
		customWordsList.insert(w, at: 0)
		let indexPath:IndexPath = IndexPath(row: 0, section: 0) // Create index path at row 0 section 0
		customWordListTableView.insertRows(at: [indexPath], with: .automatic) // Add a new spot in the table view and show an animation
		customWordListTableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
		self.performSegue(withIdentifier: "wordDetail", sender: nil)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return customWordsList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = customWordListTableView.dequeueReusableCell(withIdentifier: "cell")!
		//cell.textLabel!.text = customWordsList[indexPath.row].word
		cell.textLabel!.text = customWordsList[indexPath.row]
		return cell
	}
	
	// This function puts the table in editing mode
	override func setEditing(_ editing: Bool, animated: Bool) {
		super.setEditing(editing, animated: animated)
		customWordListTableView.setEditing(editing, animated: animated)
		self.navigationController?.setToolbarHidden(isEditing, animated: true)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		customWordsList.remove(at: indexPath.row)
		customWordListTableView.deleteRows(at: [indexPath], with: .fade)
		save()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "wordDetail", sender: nil)
	}
	
	@IBAction func addButtonPress(_ sender: Any) {
		addWord()
	}
	

	
	/*override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated);
		self.navigationController?.setToolbarHidden(true, animated: animated)
	}*/
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let customWordView:CustomWordViewController = segue.destination as! CustomWordViewController
		selectedRow = customWordListTableView.indexPathForSelectedRow!.row
		customWordView.masterView = self
		//customWordView.setText(t: customWordsList[selectedRow].word!)
		customWordView.setText(t: customWordsList[selectedRow])
	}
	
	func save() {
		UserDefaults.standard.set(customWordsList, forKey: "words")// Non-sensitive data can be saved to User Defaults
		UserDefaults.standard.synchronize()
		
		/*let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
		fileURL = baseURL.appendingPathComponent("words.txt")*/
		
		/*
		let data: Data?
		do {
			let encoder = JSONEncoder.init()
			data = try encoder.encode(customWordsList)
			if nil != data {
				let baseURL = try! FileManager.default.url(for: .documentDirectory, in: [.userDomainMask], appropriateFor: nil, create: true) {
					let fileURL = baseURL.appendingPathComponent("words.js")
					try data!.write(to: fileURL)
				}
			}
		} catch {
				print("error writing file")
		}
*/
	}
	
	func load() {
		if let loadedData = UserDefaults.standard.value(forKey: "words") as? [String] {
			customWordsList = loadedData
			customWordListTableView.reloadData()
		}
		//if let loadedData:[String] = NSArray(contentsOf: fileURL) as? [String] {
		/*if let loadedData:[(String,String,String)] = NSArray(contentsOf: fileURL) as? [(String,String,String)] {
			customWordsList = loadedData
			customWordListTableView.reloadData()
		}*/
		
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
