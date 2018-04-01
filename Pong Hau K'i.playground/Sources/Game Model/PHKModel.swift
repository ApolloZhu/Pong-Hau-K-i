import GameplayKit

public class PHKModel: NSObject {
    public var currentPlayer: PHKPlayer = .no

    public var board: [PHKPlayer] = [.p1, .p1, .no, .p2, .p2]

    public var selected = 2

    public var error: PHKInvalidMove?

    public var ai: GKStrategist?
}

extension PHKModel {
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
}
