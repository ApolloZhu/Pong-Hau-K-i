import GameplayKit

public class GameNotStartedState: GameState {
    override public func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GamePieceSelectedState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        switch previousState {
        case is GameEndedState:
            newGame()
        default:
            // TODO: Show some tips and animations
            scene?.buttons.enumerated().forEach { i, btn in
                guard model?.board[i] != .no else { return }
                btn.run(.hint)
            }
        }
    }
}
