//
//  ContentView.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 20.05.2023.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties


	// MARK: - Body
    var body: some View {
        ZStack {
			LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPirple")]), startPoint: .top, endPoint: .bottom)
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
						Text("100")
							.scoreNumberStyle()
							.customShadow()
							.layoutPriority(1)
					}
					.scoreContainerStyle()
					Spacer()
					HStack {
						Text("200")
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
						Image("gfx-bell")
							.resizable()
							.imageModifier()
					}

					HStack(alignment: .center, spacing: 0) {
						ZStack {
							ReelView()
							Image("gfx-seven")
								.resizable()
								.imageModifier()
						}
						Spacer()
						ZStack {
							ReelView()
							Image("gfx-cherry")
								.resizable()
								.imageModifier()
						}
					}
					.frame(maxWidth: 500)

					Button {

					} label: {
						Image("gfx-spin")
							.renderingMode(.original)
							.resizable()
							.imageModifier()
					}

				}
				.layoutPriority(2)

				Spacer()
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

				} label: {
					Image(systemName: "info.circle")
				}
					.customButton(),
				alignment: .topTrailing
			)
			.padding()
			.frame(maxWidth: 720)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}