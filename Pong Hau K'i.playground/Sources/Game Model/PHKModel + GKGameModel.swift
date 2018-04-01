import GameplayKit

extension PHKModel: GKGameModel {
    public func gameModelUpdates(for player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
        var moves = [PHKMove]()
        for (slot, player) in board.enumerated() {
            if player == currentPlayer,
                isEmptySpotAccessible(from: slot) {
                moves.append(PHKMove(from: slot))
            }
        }
        return moves.isEmpty ? nil : moves
    }

    public func apply(_ gameModelUpdate: GKGameModelUpdate) {
        guard let move = gameModelUpdate as? PHKMove else { return }
        board.swapAt(emptySpot, move.value)
        currentPlayer = currentPlayer.opponent
    }

    // MARK - Doesn't Matter

    public var players: [GKGameModelPlayer]? {
        get {
            return [PHKPlayer.p1, PHKPlayer.p2]
        }
    }

    public var activePlayer: GKGameModelPlayer? {
        get {
            return currentPlayer
        }
    }

    public func setGameModel(_ gameModel: GKGameModel) {
        guard let new = gameModel as? PHKModel else { return }
        currentPlayer = new.currentPlayer
        board = new.board
        selected = new.selected
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        let model = PHKModel()
        model.setGameModel(self)
        return model
    }
}
