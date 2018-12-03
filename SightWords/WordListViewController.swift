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
	
	var wordList:[String] = []
	var customWordsList:[String] = []
	var wordListData:[String] = ["Dolch","Fry","Custom"]
	var isDolchEnabled:Bool = true
	var isFryEnabled:Bool = true
	let dolchWordsList = ["a", "and", "away", "big", "blue", "can", "come", "down", "find", "for", "funny", "go", "help", "here", "I", "in", "is", "it", "jump", "little", "look", "make", "me", "my", "not", "one", "play", "red", "run", "said", "see", "the", "three", "to", "two", "up", "we", "where", "yellow", "you", "all", "am", "are", "at", "ate", "be", "black", "brown", "but", "came", "did", "do", "eat", "four", "get", "good", "have", "he", "into", "like", "must", "new", "no", "now", "one", "our", "out", "please", "pretty", "ran", "ride", "saw", "say", "she", "so", "soon", "that", "there", "they", "this", "too", "under", "want", "was", "well", "went", "what", "white", "who", "will", "with", "yes", "after", "again", "an", "any", "as", "ask", "by", "could", "every", "fly", "from", "give", "giving", "had", "has", "her", "him", "his", "how", "just", "know", "let", "live", "may", "of", "old", "once", "open", "over", "put", "round", "some", "stop", "take", "thank", "them", "then", "think", "walk", "were", "when", "always", "around", "because", "been", "before", "best", "both", "buy", "call", "cold", "does", "don’t", "fast", "first", "five", "found", "gave", "goes", "green", "its", "made", "many", "off", "or", "pull", "read", "right", "sing", "sit", "sleep", "tell", "their", "these", "those", "upon", "us", "use", "very", "wash", "which", "why", "wish", "work", "would", "write", "your", "about", "better", "bring", "carry", "clean", "cut", "done", "draw", "drink", "eight", "fall", "far", "full", "got", "grow", "hold", "hot", "hurt", "if", "keep", "kind", "laugh", "light", "long", "much", "myself", "never", "nine", "only", "own", "pick", "seven", "shall", "show", "six", "small", "start", "ten", "today", "together", "try", "warm", "apple", "baby", "back", "ball", "bear", "bed", "bell", "bird", "birthday", "boat", "box", "boy", "bread", "brother", "cake", "car", "cat", "chair", "chicken", "children", "Christmas", "coat", "corn", "cow", "day", "dog", "doll", "door", "duck", "egg", "eye", "farm", "farmer", "father", "feet", "fire", "fish", "floor", "flower", "game", "garden", "girl", "goodbye", "grass", "ground", "hand", "head", "hill", "home", "horse", "house", "kitty", "leg", "letter", "man", "men", "milk", "money", "morning", "mother", "name", "nest", "night", "paper", "party", "picture", "pig", "rabbit", "rain", "ring", "robin", "Santa Claus", "school", "seed", "sheep", "shoe", "sister", "snow", "song", "squirrel", "stick", "street", "sun", "table", "thing", "time", "top", "toy", "tree", "watch", "water", "way", "wind", "window", "wood"]
	let fryWordsList = ["a", "about", "all", "an", "and", "are", "as", "at", "be", "been", "but", "by", "called", "can", "come", "could", "day", "did", "does", "down", "each", "find", "first", "for", "from", "get", "go", "had", "has", "have", "he", "her", "him", "his", "how", "I", "if", "in", "into", "is", "it", "like", "long", "look", "made", "make", "many", "may", "more", "my", "no", "not", "now", "number", "of", "oil", "on", "one", "or", "other", "out", "part", "people", "said", "see", "she", "sit", "so", "some", "than", "that", "the", "their", "them", "then", "there", "these", "they", "this", "time", "to", "two", "up", "use", "was", "water", "way", "we", "were", "what", "when", "which", "who", "will", "with", "words", "would", "write", "you", "your", "after", "again", "air", "also", "America", "animal", "another", "answer", "any", "around", "ask", "away", "back", "because", "before", "big", "boy", "came", "change", "different", "does", "end", "even", "follow", "form", "found", "give", "good", "great", "hand", "help", "here", "home", "house", "just", "kind", "know", "land", "large", "learn", "letter", "line", "little", "live", "man", "me", "means", "men", "most", "mother", "move", "much", "must", "name", "need", "new", "off", "old", "only", "our", "over", "page", "picture", "place", "play", "point", "put", "read", "right", "same", "say", "sentence", "set", "should", "show", "small", "sound", "spell", "still", "study", "such", "take", "tell", "things", "think", "three", "through", "too", "try", "turn", "us", "very", "want", "well", "went", "where", "why", "work", "world", "years", "above", "add", "almost", "along", "always", "began", "begin", "being", "below", "between", "book", "both", "car", "carry", "children", "city", "close", "country", "cut", "don’t", "earth", "eat", "enough", "every", "example", "eyes", "face", "family", "far", "father", "feet", "few", "food", "four", "girl", "got", "group", "grow", "hard", "head", "hear", "high", "idea", "important", "Indian", "it’s", "keep", "last", "late", "leave", "left", "let", "life", "light", "list", "might", "mile", "miss", "mountains", "near", "never", "next", "night", "often", "once", "open", "own", "paper", "plant", "real", "river", "run", "saw", "school", "sea", "second", "seem", "side", "something", "sometimes", "song", "soon", "start", "state", "stop", "story", "talk", "those", "thought", "together", "took", "tree", "under", "until", "walk", "watch", "while", "white", "without", "young"]
	
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
	
	@objc func toggleSightWords(_ sender:UISwitch!){
		//print("Toggling Sight Words")
		if(sender.isOn == true) { // If the switch is being toggled on
			if(sender.tag == 0) { // Dolch
				isDolchEnabled = true
			} else if(sender.tag == 1) { // Fry
				isFryEnabled = true
			}
		} else {
			if(sender.tag == 0) { // Otherwise, switch is being toggled off
				isDolchEnabled = false // Dolch
			} else if(sender.tag == 1) {
				isFryEnabled = false // Fry
			}
		}
		
		if(isDolchEnabled && isFryEnabled) {
			wordList = Array(Set(customWordsList + dolchWordsList + fryWordsList)).sorted()
		}
		if(isDolchEnabled && !isFryEnabled) {
			wordList = Array(Set(customWordsList + dolchWordsList)).sorted()
		}
		if(!isDolchEnabled && isFryEnabled) {
			wordList = Array(Set(customWordsList + fryWordsList)).sorted()
		}
		if(!isDolchEnabled && !isFryEnabled) {
			wordList = Array(Set(customWordsList)).sorted()
		}
		save()
	}

	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell:UITableViewCell = wordListTableView.dequeueReusableCell(withIdentifier: "cell")!
		cell.textLabel?.text = wordListData[indexPath.row]
		if(cell.textLabel?.text == "Custom")
		{
			cell.accessoryType = .disclosureIndicator // Adds the little >
		} else if(cell.textLabel?.text == "Dolch") {
			let switchView = UISwitch(frame: .zero)
			switchView.setOn(isDolchEnabled, animated: true)
			switchView.tag = indexPath.row
			switchView.addTarget(self, action: #selector(self.toggleSightWords(_:)), for: .valueChanged)
			cell.accessoryView = switchView
		} else if(cell.textLabel?.text == "Fry") {
			let switchView = UISwitch(frame: .zero)
			switchView.setOn(isFryEnabled, animated: true)
			switchView.tag = indexPath.row
			switchView.addTarget(self, action: #selector(self.toggleSightWords(_:)), for: .valueChanged)
			cell.accessoryView = switchView
		}
		
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "customWordsListSegue", sender: nil)
	}
	
	func load() {
		if let loadedData = UserDefaults.standard.value(forKey: "customWords") as? [String] {
			customWordsList = loadedData
		}
		if let loadedData = UserDefaults.standard.value(forKey: "words") as? [String] {
			wordList = loadedData
		}
		if let loadedData = UserDefaults.standard.value(forKey: "dolchWordsEnabled") as? Bool {
			isDolchEnabled = loadedData
		}
		if let loadedData = UserDefaults.standard.value(forKey: "fryWordsEnabled") as? Bool {
			isFryEnabled = loadedData
		}
	}
		
	func save() {
		UserDefaults.standard.set(wordList, forKey: "words")// Non-sensitive data can be saved to User Defaults
		UserDefaults.standard.set(isDolchEnabled, forKey: "dolchWordsEnabled")
		UserDefaults.standard.set(isFryEnabled, forKey: "fryWordsEnabled")
		}
	

}
