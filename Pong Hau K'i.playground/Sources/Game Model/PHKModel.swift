import GameplayKit

public class PHKModel: NSObject, GKGameModel {
    public var players: [GKGameModelPlayer]?
        = [PHKPlayer.p1, PHKPlayer.p2]

    public var activePlayer: GKGameModelPlayer? {
        get {
            return currentPlayer
        }
        set {
            currentPlayer = newValue as? PHKPlayer ?? currentPlayer
        }
    }

    public var currentPlayer: PHKPlayer = .no

    public var board: [PHKPlayer] = [.p1, .p1, .no, .p2, .p2]

    public var emptySpot: Int {
        return board.index(of: .no)!
    }

    /// 0---1
    /// |\ /|
    /// | 2 |
    /// |/ \|
    /// 4   3
    /// So it can't be 3 <-> 4,
    /// 0 <-> 3, or 1 <-> 4
    func isEmptySpotAccessible(from place: Int) -> Bool {
        return (emptySpot + place) != 7
            && abs(emptySpot - place) != 3
    }

    public func setGameModel(_ gameModel: GKGameModel) {
        guard let new = gameModel as? PHKModel else { return }
        currentPlayer = new.currentPlayer
        board = new.board
    }

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
        // TODO: Update UI
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        let model = PHKModel()
        model.setGameModel(self)
        return model
    }
}

