import GameplayKit


public class GameSwapPieceState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is GameIdelState.Type,
             is GameEndedState.Type:
            return true
        default:
            return false
        }
    }

    public override func didEnter(from previousState: GKState?) {
        
    }
}
