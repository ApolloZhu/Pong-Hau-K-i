import GameplayKit

public class GameIdelState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GamePieceSelectedState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        switch previousState {
        case is GameSwapPieceState,
             is GameInvalidMoveState:
            break
        default:
            return
        }
    }
}
