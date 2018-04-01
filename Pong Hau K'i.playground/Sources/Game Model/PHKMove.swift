import GameplayKit

public class PHKMove: NSObject, GKGameModelUpdate {
    /// The id of the place to move to.
    public var value: Int = -1
}

public class PHKModel: NSObject, GKGameModel {
    public var players: [GKGameModelPlayer]?
        = [PHKPlayer.no, PHKPlayer.p1, PHKPlayer.p2]

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
        // TODO:
        return nil
    }

    public func apply(_ gameModelUpdate: GKGameModelUpdate) {
        // TODO:
        return
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        let model = PHKModel()
        model.setGameModel(self)
        return model
    }
}
