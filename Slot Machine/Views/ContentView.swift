//
//  ContentView.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 20.05.2023.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties
	@ObservedObject private var viewModel = ContentViewModel()
	@State private var showingInfoView = false

	// MARK: - Body
    var body: some View {
        ZStack {
			LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)

			VStack(alignment: .center, spacing: 5) {
				LogoView()

				Spacer()
				// MARK: - Coins and High Score
				HStack {
					HStack {
						Text("Your\nCoins".uppercased())
							.scoreLabelStyle()
							.multilineTextAlignment(.trailing)
						Text("\(viewModel.coins)")
							.scoreNumberStyle()
							.customShadow()
							.layoutPriority(1)
					}
					.scoreContainerStyle()
					Spacer()
					HStack {
						Text("\(viewModel.highScore)")
							.scoreNumberStyle()
							.customShadow()
							.layoutPriority(1)
						Text("High\nScore".uppercased())
							.scoreLabelStyle()
							.multilineTextAlignment(.leading)
					}
					.scoreContainerStyle()
				}

				// MARK: - Slot Machine
				VStack(alignment: .center, spacing: 0) {
					ZStack {
						ReelView()
						Image(viewModel.symbols[viewModel.reels[0]])
							.resizable()
							.imageModifier()
					}

					HStack(alignment: .center, spacing: 0) {
						ZStack {
							ReelView()
							Image(viewModel.symbols[viewModel.reels[1]])
								.resizable()
								.imageModifier()
						}
						Spacer()
						ZStack {
							ReelView()
							Image(viewModel.symbols[viewModel.reels[2]])
								.resizable()
								.imageModifier()
						}
					}
					.frame(maxWidth: 500)

					Button {
						viewModel.spinReels()
						viewModel.checkWinning()
					} label: {
						Image("gfx-spin")
							.renderingMode(.original)
							.resizable()
							.imageModifier()
					}

				}
				.layoutPriority(2)

				Spacer()
				// MARK: - Bet buttons
				HStack {
					HStack(alignment: .center, spacing: 10) {
						Button {
							viewModel.activateBet20()
						} label: {
							Text("20")
								.fontWeight(.heavy)
								.foregroundColor( viewModel.isActiveBet20 ? Color("ColorYellow") : .white)
								.betNumberModifier()
								.customShadow()
						}
						.background(
							Capsule()
								.fill(LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom))
								.customShadow()
						).padding(3)

						Image("gfx-casino-chips")
							.resizable()
							.opacity(viewModel.isActiveBet20 ? 1 : 0)
							.scaledToFit()
							.frame(height: 64)
							.animation(.default)
							.customShadow()
					}

					HStack(alignment: .center, spacing: 10) {
						Image("gfx-casino-chips")
							.resizable()
							.opacity(viewModel.isActiveBet10 ? 1 : 0)
							.scaledToFit()
							.frame(height: 64)
							.animation(.default)
							.customShadow()
						Button {
							viewModel.activateBet10()
						} label: {
							Text("10")
								.fontWeight(.heavy)
								.foregroundColor(viewModel.isActiveBet10 ? Color("ColorYellow") : .white)
								.betNumberModifier()
								.customShadow()
						}
						.background(
							Capsule()
								.fill(LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom))
								.customShadow()
						).padding(3)
					}
				}
			}
			.overlay(
				Button {

				} label: {
					Image(systemName: "arrow.2.circlepath.circle")
				}
					.customButton(),
				alignment: .topLeading
			)
			.overlay(
				Button {
					showingInfoView = true
				} label: {
					Image(systemName: "info.circle")
				}
					.customButton(),
				alignment: .topTrailing
			)
			.padding()
			.frame(maxWidth: 720)
        }
		.sheet(isPresented: $showingInfoView) { InfoView() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
