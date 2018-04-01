import GameplayKit

extension GameState {
    func runAI() {
        guard let model = model, let ai = ai else { return }
        let move: GKGameModelUpdate?
        if let minMax = ai as? GKMinmaxStrategist {
            move = minMax.randomMove(for: model.currentPlayer,
                                     fromNumberOfBestMoves: 2)
        } else {
            move = ai.bestMoveForActivePlayer()
        }
        guard let selected = move as? PHKMove else { return }
        model.selected = selected.slot
        stateMachine?.enter(GamePieceSelectedState.self)
    }
}
