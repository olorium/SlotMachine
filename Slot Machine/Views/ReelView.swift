//
//  ReelView.swift
//  Slot Machine
//
//  Created by Oleksii Vasyliev on 20.05.2023.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
			.resizable()
			.imageModifier()
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView()
    }
}
