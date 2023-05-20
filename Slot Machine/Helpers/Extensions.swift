//
//  Extensions.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 20.05.2023.
//

import SwiftUI

extension Text {
	/// Specific style for the Score label text
	/// - Returns: Text view with applied modifiers
	func scoreLabelStyle() -> Text {
		self
			.foregroundColor(.white)
			.font(.system(size: 10, weight: .bold, design: .rounded))
	}

	/// Specific style for the Score number text
	/// - Returns: Text view with applied modifiers
	func scoreNumberStyle() -> Text {
		self
			.foregroundColor(.white)
			.font(.system(.title, design: .rounded))
			.fontWeight(.heavy)
	}
}
