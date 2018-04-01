//: [Previous](@previous)
//: This is where AI strategies are implemented:
import GameplayKit

//: Let's first look at this implementation.
let strategist = GKMinmaxStrategist()
strategist.maxLookAheadDepth = 5
ai = strategist
//:
//: `true` means the AI player goes first;
//: `false` means you go first.
aiGoesFirst = true
newGame()
//: [Next](@next)
