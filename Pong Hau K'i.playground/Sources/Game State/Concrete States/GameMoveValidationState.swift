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

    func invalid(bc reason: PHKInvalidMove) {
        model?.error = reason
        stateMachine?.enter(GameInvalidMoveState.self)
    }

    public override func didEnter(from previousState: GKState?) {
        guard let model = model else { return }
        guard model.selected != model.emptySpot
            else { return invalid(bc: .empty) }
        guard model.board[model.selected] == model.currentPlayer
            else { return invalid(bc: .unowned) }
        guard model.isEmptySpotAccessible(from: model.selected)
            else { return invalid(bc: .notMovable) }
        stateMachine?.enter(GameSwapPieceState.self)
    }
}
