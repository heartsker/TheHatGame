//
//  Game.swift
//  TheHatGame
//
//  Created by Daniel Pustotin on 24.08.2021.
//

import Foundation

struct Game {
	var playersCount: Int = 2
	var hat: Set<String> = easyWords
	var roundDuration: TimeInterval = 30
}
