//: [Previous: Monte Carlo strategy](@previous)
import GameplayKit
//: The minmax strategy is a better method, as it maximize the chance for AI to win and reduce the opponet's chance.
let strategist = GKMinmaxStrategist()
//: - Note:
//: A larger look ahead depth means a smarter AI, however it will take more time to evaluate.

//: - Experiment:
//: Try to change this 1 to 5 and see how it gets smarter:
strategist.maxLookAheadDepth = 1

//: Assign our strategist as the AI player:
aiGoesFirst = true
ai = strategist
newGame()
//: [Next: Implement your own AI](@next)
