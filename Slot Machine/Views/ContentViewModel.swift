//
//  ContentViewModel.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 21.05.2023.
//

import Foundation

final class ContentViewModel: ObservableObject {
	/// Collection of reels, where every number represents one reel.
	@Published var reels = [0, 1 ,2]
	/// High score in the game.
	@Published var highScore = UserDefaults.standard.integer(forKey: "HighScore")
	/// Number of coins to play with.
	@Published var coins = 100
	/// Bet amount in every spin.
	@Published var betAmount = 10
	/// Flag to track when bet 10 is active.
	@Published var isActiveBet10 = true
	/// Flag to track when bet 20 is active.
	@Published var isActiveBet20 = false
	/// Indicates either Game Over modal is presented.
	@Published var showingModal = false
	/// Collection of images for the reels.
	let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]

	// MARK: - Methods

	/// Spins reels and updates images for them.
	func spinReels() {
		reels = reels.map { _ in
			Int.random(in: 0...symbols.count - 1)
		}
	}

	/// Checks if winning conditions are met after every spin.
	func checkWinning() {
		if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
			playerWins()
			if coins > highScore {
				newHighScore()
			}
		} else {
			playerLoses()
			if coins <= 0 {
				showingModal = true
			}
		}
	}

	/// Updates number of coins if player wins.
	func playerWins() {
		coins += betAmount * 10
	}

	/// Updates number of coins if player loses.
	func playerLoses() {
		coins -= betAmount
	}

	/// Sets new high score.
	func newHighScore() {
		highScore = coins
		UserDefaults.standard.set(highScore, forKey: "HighScore")
	}
	
	/// Sets active bet 20 coins.
	func activateBet20() {
		betAmount = 20
		isActiveBet20 = true
		isActiveBet10 = false
	}

	/// Sets active bet 10 coins.
	func activateBet10() {
		betAmount = 10
		isActiveBet10 = true
		isActiveBet20 = false
	}
	/// Resets the game and sets scores and coins to default values.
	func resetGame() {
		UserDefaults.standard.set(0, forKey: "HighScore")
		highScore = 0
		coins = 100
		activateBet10()
	}
}
