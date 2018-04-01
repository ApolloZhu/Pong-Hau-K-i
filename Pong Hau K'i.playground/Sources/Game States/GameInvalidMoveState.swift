import GameplayKit

public class GameInvalidMoveState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameIdelState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        
    }
}
