//
//  Modifiers.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 20.05.2023.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
	func body(content: Content) -> some View {
		content.shadow(color: Color("ColorShadow"), radius: 0, x: 0, y: 6)
	}
}

struct ButtonModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.title)
			.accentColor(.white)
	}
}

struct ScoreContainerModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.padding(.vertical, 4)
			.padding(.horizontal, 16)
			.frame(minWidth: 128)
			.background(
				Capsule()
					.foregroundColor(Color("ColorShadow"))
			)
	}
}

struct ImageModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.scaledToFit()
			.frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 130, idealHeight: 190, maxHeight: 200, alignment: .center)
			.customShadow()
	}
}

struct BetNumberModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.system(.title, design: .rounded))
			.padding(.vertical, 5)
			.frame(width: 90)
	}
}

extension View {
	func customShadow() -> some View {
		modifier(ShadowModifier())
	}

	func customButton() -> some View {
		modifier(ButtonModifier())
	}

	func scoreContainerStyle() -> some View {
		modifier(ScoreContainerModifier())
	}

	func imageModifier() -> some View {
		modifier(ImageModifier())
	}

	func betNumberModifier() -> some View {
		modifier(BetNumberModifier())
	}
}
