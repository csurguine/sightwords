//
//  WordMatchViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 12/3/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit
import TextToSpeechV1
import AVFoundation

class WordMatchViewController: UIViewController {
	

	@IBOutlet weak var wordMatchLabel: UILabel!
	@IBOutlet weak var nextButton: UIButton!
	
	
	@IBOutlet weak var word1Button: UIButton!
	
	@IBOutlet weak var word2Button: UIButton!
	
	@IBOutlet weak var word3Button: UIButton!
	
	@IBOutlet weak var word4Button: UIButton!
	
	
	var username = "77fea422-c8da-45ab-a4bb-bc1f76487d71"
	var password = "ZCRcXAbIGEtq"
	var textToSpeech: TextToSpeech?
	var wordsList:[String] = []
	var timerInterval:TimeInterval = 0.0
	var audioPlayer: AVAudioPlayer!
	var timer: Timer?
	var wordSetSize = 0
	var runCount = 0
	var correctWordIndex = -1
	var words:[String] = [] // Array to hold the four words on the screen
	
    override func viewDidLoad() {
        super.viewDidLoad()
		load()
		wordMatchLabel.text = "Please find the word"
		textToSpeech = TextToSpeech(username: username, password: password)
		resetLabel()
	}
	
	func resetLabel() {
		runCount = runCount + 1
		nextButton.isHidden = true
		// Grab four words from the list
		words.insert(wordsList.randomElement()!, at: 0)
		words.insert(wordsList.randomElement()!, at: 0)
		words.insert(wordsList.randomElement()!, at: 0)
		words.insert(wordsList.randomElement()!, at: 0)
		
		word1Button.tintColor = UIColor.blue
		word2Button.tintColor = UIColor.blue
		word3Button.tintColor = UIColor.blue
		word4Button.tintColor = UIColor.blue
		
		word1Button.setTitle(words[0], for: .normal)
		word2Button.setTitle(words[1], for: .normal)
		word3Button.setTitle(words[2], for: .normal)
		word4Button.setTitle(words[3], for: .normal)
		
		
		// Select one of the four words at random
		correctWordIndex = Int(arc4random_uniform(4))
		
		play(word: wordMatchLabel.text! + ", " + words[correctWordIndex])
	
		Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(triggerTimer), userInfo: nil, repeats: false)
    }
    
	@IBAction func word1ButtonTouched(_ sender: Any) {
		if(correctWordIndex == 0) {
			word1Button.tintColor = UIColor.green
			word1Button.setTitle("✓ " + word1Button.currentTitle!, for: .normal)
		} else {
			word1Button.tintColor = UIColor.red
		}
	}
	
	@IBAction func word2ButtonTouched(_ sender: Any) {
		if(correctWordIndex == 1) {
			word2Button.tintColor = UIColor.green
			word2Button.setTitle("✓ " + word2Button.currentTitle!, for: .normal)
		} else {
			word2Button.tintColor = UIColor.red
		}
	}
	
	@IBAction func word3ButtonTouched(_ sender: Any) {
		if(correctWordIndex == 2) {
			word3Button.tintColor = UIColor.green
			word3Button.setTitle("✓ " + word3Button.currentTitle!, for: .normal)
		} else {
			word3Button.tintColor = UIColor.red
		}
	}
	
	@IBAction func word4ButtonTouched(_ sender: Any) {
		if(correctWordIndex == 3) {
			word4Button.tintColor = UIColor.green
			word4Button.setTitle("✓ " + word4Button.currentTitle!, for: .normal)
		} else {
			word4Button.tintColor = UIColor.red
		}
	}
	
	
	@IBAction func nextButtonTouched(_ sender: Any) {
		resetLabel()
	}
	
	@objc func triggerTimer() {
		timer?.invalidate()
		if(runCount + 1 > wordSetSize) {
			nextButton.isHidden = true
			wordMatchLabel.text = "Congrats! You've completed the word set"
		} else {
			nextButton.isHidden = false
		}
	}
	
	
	
	func load() {
		if let loadedData = UserDefaults.standard.value(forKey: "words") as? [String] {
			wordsList = loadedData
		}
		timerInterval = TimeInterval(UserDefaults.standard.integer(forKey: "timerInterval"))
		wordSetSize = UserDefaults.standard.integer(forKey: "wordSetSize")
	}
	
	func play (word:String) {
		let text = word
		let accept = "audio/wav"
		let failure = { (error: Error) in print(error)}
		textToSpeech!.synthesize(text: text, accept: accept, failure: failure) { data in
			self.audioPlayer = try! AVAudioPlayer(data: data)
			self.audioPlayer.prepareToPlay()
			self.audioPlayer.play()
		}
	}
	
	


}
