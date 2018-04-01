import GameplayKit

public class GameStartNewState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameNotStartedState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        newGame()
    }
}
