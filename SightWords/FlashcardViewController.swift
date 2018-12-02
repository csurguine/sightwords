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
	@IBOutlet weak var helpButton: UIButton!
	@IBOutlet weak var sightWordLabel: UILabel!
	@IBOutlet weak var nextButton: UIButton!
	
	var customWordsList:[String] = []
	var audioPlayer: AVAudioPlayer!
	var timer: Timer?
	var timerInterval:TimeInterval = 0.0
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
		sightWordLabel.text = customWordsList.randomElement()
		nextButton.isHidden = true
		play(word: flashcardLabel.text!) // Ask the user what word this is
		Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(triggerTimer), userInfo: nil, repeats: false) // Start a timer to play the word
	}

	@IBAction func helpButtonTouched(_ sender: Any) {
		play(word: sightWordLabel.text!)
	}
	
	
	@IBAction func nextButtonTouched(_ sender: Any) {
		resetLabel()
	}
	
	func play (word:String) {
		/*let username = "77fea422-c8da-45ab-a4bb-bc1f76487d71"
		let password = "ZCRcXAbIGEtq"
		let textToSpeech = TextToSpeech(username: username, password: password)
		*/
		
		let text = word
		let accept = "audio/wav"
		let failure = { (error: Error) in print(error)}
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
		if let loadedData = UserDefaults.standard.string(forKey: "timerInterval") {
			timerInterval = TimeInterval(loadedData)!
			//timerLabel.text? = timerInterval.description
		}
	}
	
	@objc func triggerTimer() {
		//print("Timer fired!")
		play(word: sightWordLabel.text!) // Play the sight word
		timer?.invalidate() // Cancel the timer
		nextButton.isHidden = false
		//timerLabel.text? = "Times up!"
		//viewDidLoad()
	}

}
