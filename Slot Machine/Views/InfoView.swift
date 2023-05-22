//
//  InfoView.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 20.05.2023.
//

import SwiftUI

struct InfoView: View {
	@Environment(\.presentationMode) var presentationMode
	
    var body: some View {
		VStack(alignment: .center, spacing: 10) {
			LogoView()
			Spacer()

			Form {
				Section(header: Text("About the application")) {
					FormRowView(title: "Application", value: "Slot Machine")
					FormRowView(title: "Platforms", value: "iOS, iPadOS, macOS")
					FormRowView(title: "Developer", value: "Oleksii Vasyliev")
					FormRowView(title: "Designer", value: "Robert Petras")
					FormRowView(title: "Music", value: "Den Lebowitz")
					FormRowView(title: "Copyright", value: "© 2022 All rights reserved.")
					FormRowView(title: "Version", value: "1.0.0")
				}
			}
			.font(.system(.body, design: .rounded))
		}
		.padding(.top, 40)
		.overlay(
			Button(action: {
				Player().audioPlayer?.stop()
				presentationMode.wrappedValue.dismiss()
			}, label: {
				Image(systemName: "xmark.circle")
					.font(.title)
			})
			.padding(.top, 30)
			.padding(.trailing, 20)
			.accentColor(.secondary)
			, alignment: .topTrailing
		)
		.onAppear {
			Player().playSound(sound: "background-music", type: "mp3")
		}
    }
}

struct FormRowView: View {
	// MARK: - Properties
	/// the title for the row
	let title: String
	/// the value for the row
	let value: String

	// MARK: - Body
	var body: some View {
		HStack {
			Text(title).foregroundColor(.gray)
			Spacer()
			Text(value)
		}
	}
}

struct InfoView_Previews: PreviewProvider {
	static var previews: some View {
		InfoView()
	}
}
