//: [Previous: Minmax strategy](@previous)

//: In addition to the two strategists `GameplayKit`` provides, we can write our own artificial-intelligent player.
import GameplayKit
//: Let's first start by defining our own AI class:
class YourOwnStrategist: NSObject,
//: Conform to the `GKStrategist` protocol to indicate we are able to choose moves:
GKStrategist {
    var gameModel: GKGameModel?
    var randomSource: GKRandom?

    func bestMoveForActivePlayer() -> GKGameModelUpdate? {
//: We we are asked to make a decision, let's first make sure everything we need exists:
        guard let model = gameModel
            , let player = model.activePlayer
            , let updates = model.gameModelUpdates(for: player)
            , !updates.isEmpty
//: If not, we `return nil`, meaning we can't make a decision:
            else { return nil }
//: Now we can implement our own logic to find the best solution...
//: - Example:
//: The following implementation returns a random move...
        let rand = randomSource ?? GKARC4RandomSource()
        let index = rand.nextInt(upperBound: updates.count)
        return updates[index]
//: - Note: Surprise! It turns out that the result isn't too bad, WOW.
    }
}
//: Finally, we assign our own strategist as the AI player:
ai = YourOwnStrategist()
//: And start the game! Enjoy!
newGame()
//: [Next: License](@next)
