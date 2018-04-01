//: [Previous: Monte Carlo strategy](@previous)

//: This is where AI strategies are implemented:
import GameplayKit

//: Let's first look at this implementation.
let strategist = GKMinmaxStrategist()
//: - Experiment:
//: A larger look ahead depth means a smarter AI, however it will take more time to evaluate.
strategist.maxLookAheadDepth = 5
ai = strategist
//: `true` means the AI player goes first;
//: `false` means you go first.
aiGoesFirst = true
newGame()
//: [Next: Implement your own AI](@next)
