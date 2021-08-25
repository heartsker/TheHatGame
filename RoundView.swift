//
//  RoundView.swift
//  TheHatGame
//
//  Created by Daniel Pustotin on 22.08.2021.
//

import SwiftUI

fileprivate enum RoundStage {
	case start
	case round
	case finish
}

struct RoundView: View {

	@Binding var game: Game

	@State private var currentWord: String!
	@State var playerSay: Player
	@State var playerGuess: Player

	@State private var remainingTime: TimeInterval!
	private let timer = Timer.publish(every: timerStep, on: .main, in: .common).autoconnect()

	@State private var roundStage: RoundStage = .start

    var body: some View {
		ZStack {
			VStack {
				Spacer()

				HStack {
					Spacer()

					Text(playerSay.name)

					Image(systemName: "arrow.forward")

					Text(playerGuess.name)

					Spacer()
				}

				Spacer()

				switch roundStage {
				case .start:
					Button(action: {
						startRound()
					}, label: {
						Text("Start")
							.font(.custom("Sans", size: 60))
							.multilineTextAlignment(.center)
					})
				case .round:
					Button(action: {
						nextWord()
					}, label: {
						Text(currentWord)
							.font(.custom("Sans", size: 60))
							.multilineTextAlignment(.center)
					})
				case .finish:
					EmptyView()
				}

				Spacer()

				Button(action: {
					nextWord()
				}, label: {
					Text("Pass")
				})

				Spacer()

				Text("\(remainingTime != nil ? "\(Int(remainingTime!.rounded()))" : "")")
					.onReceive(timer) { _ in
						if remainingTime != nil {
							remainingTime -= timerStep
						}
					}
					.font(.largeTitle)

				Spacer()

			}
		}
    }

	func startRound() {
		roundStage = .round
		currentWord = game.hat.first!
		remainingTime = game.roundDuration
	}

	func nextWord() {
		game.hat.remove(at: game.hat.startIndex)
		if game.hat.count == 0 {

		}
		currentWord = game.hat.first!
	}

	func finishRound() {
		roundStage = .finish
	}
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
		RoundView(game: .constant(Game()), playerSay: Player(name: "Tom"), playerGuess: Player(name: "Jerry"))
    }
}
