//
//  Player.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 22.05.2023.
//

import AVFoundation

class Player {
	/// Audio player.
	var audioPlayer: AVAudioPlayer?

	/// Play sound effect.
	/// - Parameters:
	///   - sound: name of file.
	///   - type: type of file.
	func playSound(sound: String, type: String) {
		guard let path = Bundle.main.path(forResource: sound, ofType: type) else { return }
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
			audioPlayer?.play()
		} catch {
			print("Error playing sound")
		}
	}
}
