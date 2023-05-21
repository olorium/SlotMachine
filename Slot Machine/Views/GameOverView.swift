//
//  GameOverView.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 21.05.2023.
//

import SwiftUI

struct GameOverView: View {

	// MARK: - Properties
	var viewModel: ContentViewModel

	// MARK: - Body
	var body: some View {
		ZStack {
			Color.black.opacity(0.1).edgesIgnoringSafeArea(.all)
			VStack(spacing: 0) {
				Text("Gave Over".capitalized)
					.font(.system(.title, design: .rounded))
					.fontWeight(.heavy)
					.padding()
					.frame(minWidth: 0, maxWidth: .infinity)
					.background(Color("ColorPink"))
					.foregroundColor(.white)
				Spacer()

				VStack(alignment: .center, spacing: 16) {
					Image("gfx-seven-reel")
						.resizable()
						.scaledToFit()
						.frame(maxHeight: 72)
					Text("Bad luck! You lost all of your coins. \nLet's play again")
						.font(.system(.body, design: .rounded))
						.lineLimit(2)
						.multilineTextAlignment(.center)
						.foregroundColor(.gray)
						.layoutPriority(1)
					Button {
						viewModel.showingModal = false
						viewModel.coins = 100
					} label: {
						Text("New game".uppercased())
							.font(.system(.body, design: .rounded))
							.fontWeight(.semibold)
							.accentColor(Color("ColorPink"))
							.padding(.horizontal, 12)
							.padding(.vertical, 8)
							.frame(minWidth: 128)
							.background(
								Capsule()
									.strokeBorder(lineWidth: 1.75)
									.foregroundColor(Color("ColorPink"))
							)
					}

				}
				Spacer()
			}
			.frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
			.background(Color.white)
			.cornerRadius(20)
			.customShadow()
		}
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
		GameOverView(viewModel: ContentViewModel())
    }
}
