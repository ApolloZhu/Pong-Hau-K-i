import GameplayKit

public class GamePieceSelectedState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameMoveValidationState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        scene?.buttons.forEach {
            $0.removeAllActions()
            $0.run(SKAction.resetPiece(in: 0))
        }
        switch previousState {
        case is GameNotStartedState:
            model!.currentPlayer = model!.board[model!.selected]
            fallthrough
        case is GameIdelState:
            stateMachine?.enter(GameMoveValidationState.self)
        default:
            return
        }
    }
}
