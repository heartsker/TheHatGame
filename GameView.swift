//
//  GameView.swift
//  TheHatGame
//
//  Created by Daniel Pustotin on 22.08.2021.
//

import SwiftUI

enum GameStage {
	case home
	case settings
	case game
	case gameOver
}

struct GameView: View {

	var gameStage: GameStage = .home
	@State var game: Game = Game()

    var body: some View {
		ZStack {
			NavigationView {
				VStack {
					NavigationLink(
						destination: GamePropertiesView(game: $game)) {
							Text("Properties")
						}
				}
			}
		}
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
