import GameplayKit

public class GameIdelState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GamePieceSelectedState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        guard let model = model else { return }
        scene?.buttons.enumerated().forEach { i, btn in
            if model.board[i] == model.currentPlayer,
                model.isEmptySpotAccessible(from: i) {
                btn.run(.hint)
            }
        }
    }
}
