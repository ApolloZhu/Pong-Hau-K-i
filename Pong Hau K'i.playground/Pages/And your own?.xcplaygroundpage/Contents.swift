//: [Previous](@previous)

import GameplayKit

class YourOwnStrategist: NSObject, GKStrategist {
    var gameModel: GKGameModel?
    var randomSource: GKRandom?

    func bestMoveForActivePlayer() -> GKGameModelUpdate? {
        guard let model = gameModel
            , let player = model.activePlayer
            , let updates = model.gameModelUpdates(for: player)
            , !updates.isEmpty
            else { return nil }
        // We can implement other way to find the best solution...
        // Or, like the following example below,
        // just randomly chose one?
        let rand = randomSource ?? GKARC4RandomSource()
        let index = rand.nextInt(upperBound: updates.count)
        return updates[index]
    }
}
ai = YourOwnStrategist()
newGame()
//: [Next](@next)
