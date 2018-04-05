//: [Previous: How to play the game](@previous)
//: This is where AI strategies are implemented:
import GameplayKit
//: Let's first look at this implementation.
//: It only needs to know if a player won or not.
let strategist = GKMonteCarloStrategist()
//: Then we decide wehter the AI player should go first.
//: - Experiment:
//: `true` means the AI player goes first;
//: `false` means you go first.
aiGoesFirst = true
ai = strategist
newGame()
//: [Next: A better AI](@next)
