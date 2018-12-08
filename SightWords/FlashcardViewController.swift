//
//  FlashcardViewController.swift
//  SightWords
//
//  Created by Chris Surguine on 11/18/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit
import TextToSpeechV1
import AVFoundation

class FlashcardViewController: UIViewController {
	@IBOutlet weak var flashcardLabel: UILabel!
	@IBOutlet weak var sightWordLabel: UILabel!
	@IBOutlet weak var nextButton: UIButton!
	@IBOutlet weak var wordSetCounterLabel: UILabel!
	@IBOutlet weak var helpButton: UIButton!
	
	var customWordsList:[String] = []
	var audioPlayer: AVAudioPlayer!
	var timer: Timer?
	var timerInterval:TimeInterval = 0.0
	var wordSetSize = 0
	var runCount = 0
	var username = "77fea422-c8da-45ab-a4bb-bc1f76487d71"
	var password = "ZCRcXAbIGEtq"
	var textToSpeech: TextToSpeech?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		load() // Load data from UserDefaults
		flashcardLabel.text = "What word is this?"
		textToSpeech = TextToSpeech(username: username, password: password)
		resetLabel()
    }
	
	func resetLabel() {
		runCount = runCount + 1
		//wordSetCounterLabel.text = "Entering resetLabel" + String(runCount) + "/" + String(wordSetSize)
		nextButton.isHidden = true // When we change the sight word, hide the next button
		sightWordLabel.text = customWordsList.randomElement()
		play(word: flashcardLabel.text!) // Ask the user what word this is
		Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(triggerTimer), userInfo: nil, repeats: false) // Start a timer to play the word
	}
	
	@objc func triggerTimer() {
		play(word: sightWordLabel.text!) // Play the sight word
		timer?.invalidate() // Cancel the timer
		
		// If we've reached the end of the flashcards, let the user know
		if(runCount + 1 > wordSetSize) {
			nextButton.isHidden = true
			flashcardLabel.text = "Congrats! You've completed the word set"
			sightWordLabel.text = ""
		} else {
			nextButton.isHidden = false
		}
		// When the timer's up, unhide the next button
		//timerLabel.text? = "Times up!"
		//viewDidLoad()
	}

	
	@IBAction func helpButtonTouched(_ sender: Any) {
		play(word: sightWordLabel.text!)
	}
	
	@IBAction func nextButtonTouched(_ sender: Any) {
		resetLabel()
	}
	
	func play (word:String) {
		let text = word
		let accept = "audio/wav"
		let failure = { (error: Error) in print(error)}
		/*textToSpeech?.getPronunciation(text: text, voice: "en-USMichaelVoice", format: "ipa", failure: failure) { data in
			self.audioPlayer = try! AVAudioPlayer(data: data)
			self.audioPlayer.prepareToPlay()
			self.audioPlayer.play()
			
		}*/
		textToSpeech!.synthesize(text: text, accept: accept, failure: failure) { data in
			self.audioPlayer = try! AVAudioPlayer(data: data)
			self.audioPlayer.prepareToPlay()
			self.audioPlayer.play()
		}
	}
	
	func load() {
		if let loadedData = UserDefaults.standard.value(forKey: "words") as? [String] {
			customWordsList = loadedData
		}
		timerInterval = TimeInterval(UserDefaults.standard.integer(forKey: "timerInterval"))
		wordSetSize = UserDefaults.standard.integer(forKey: "wordSetSize")
	}
	


}
