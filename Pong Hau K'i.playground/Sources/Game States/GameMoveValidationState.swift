import GameplayKit

public class GameMoveValidationState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is GameSwapPieceState.Type,
             is GameInvalidMoveState.Type:
            return true
        default:
            return false
        }
    }

    public override func didEnter(from previousState: GKState?) {
        
    }
}
