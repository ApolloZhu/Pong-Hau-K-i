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
        let this = model!.selected, empty = model!.emptySpot
        model?.apply(PHKMove(from: this))
        [this, empty].forEach {
            scene?.buttons[$0].fillColor = model!.board[$0].fill
            scene?.buttons[$0].strokeColor = model!.board[$0].stroke
        }
        if model?.isLoss(for: model!.currentPlayer) == true {
            stateMachine?.enter(GameEndedState.self)
        } else {
            stateMachine?.enter(GameIdelState.self)
        }
    }
}
