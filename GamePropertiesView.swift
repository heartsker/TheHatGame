//
//  GamePropertiesView.swift
//  TheHatGame
//
//  Created by Daniel Pustotin on 24.08.2021.
//

import SwiftUI

struct GamePropertiesView: View {

	@Binding var game: Game

	@State private var playersCount: String = ""

	var body: some View {
		ZStack {
			NavigationView {
				VStack {
					HStack {
						Text("Number of players")
						TextField("", text: $playersCount, onEditingChanged: { _ in
							game.playersCount = Int(playersCount) ?? 0
						})
					}

					NavigationLink(
						destination: RoundView(game: $game, playerSay: Player(name: "Harry"), playerGuess: Player(name: "Potter")),
						label: {
							Text("Round")
						})
				}
			}
		}
		.frame(width: <#T##CGFloat?#>, height: <#T##CGFloat?#>, alignment: <#T##Alignment#>)
	}
}

struct GamePropertiesView_Previews: PreviewProvider {
	static var previews: some View {
		GamePropertiesView(game: .constant(Game()))
	}
}
