//
//  SightWord.swift
//  SightWords
//
//  Created by Chris Surguine on 11/16/18.
//  Copyright © 2018 Chris Surguine. All rights reserved.
//

import UIKit

struct SightWord : Codable{
	var word : String?
	var phonetic : String?
	init(word: String, phonetic:String) {
		self.word = word
		self.phonetic = phonetic
	}
}
