import GameplayKit

public class GamePieceSelectedState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameMoveValidationState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        switch previousState {
        case is GameNotStartedState:
            break
        case is GameIdelState:
            break
        default:
            return
        }
    }
}
