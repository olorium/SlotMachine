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
	@Published var highScore = 0
	/// Number of coins to play with.
	@Published var coins = 100
	/// Bet amount in every spin.
	@Published var betAmount = 10
	/// Collection of images for the reels.
	let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]

	// MARK: - Methods

	/// Spins reels and updates images for them.
	func spinReels() {
		reels = reels.map { _ in
			Int.random(in: 0...symbols.count - 1)
		}
	}

	/// Checks if winning conditions are met.
	func checkWinning() {
		if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
			playerWins()
			if coins > highScore {
				newHighScore()
			}
		} else {
			playerLoses()
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
	}
}
