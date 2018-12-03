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
	
	@IBOutlet weak var word1Label: UILabel!
	@IBOutlet weak var word2Label: UILabel!
	@IBOutlet weak var word3Label: UILabel!
	@IBOutlet weak var word4Label: UILabel!
	
	var username = "77fea422-c8da-45ab-a4bb-bc1f76487d71"
	var password = "ZCRcXAbIGEtq"
	var textToSpeech: TextToSpeech?
	var customWordsList:[String] = []
	var timerInterval:TimeInterval = 0.0
	var wordSetSize = 0
	
    override func viewDidLoad() {
        super.viewDidLoad()
		load()
        word1Label.text = customWordsList.randomElement()
		word2Label.text = customWordsList.randomElement()
		word3Label.text = customWordsList.randomElement()
		word4Label.text = customWordsList.randomElement()
    }
    

	func load() {
		if let loadedData = UserDefaults.standard.value(forKey: "words") as? [String] {
			customWordsList = loadedData
		}
		timerInterval = TimeInterval(UserDefaults.standard.integer(forKey: "timerInterval"))
		wordSetSize = UserDefaults.standard.integer(forKey: "wordSetSize")
	}

}
