import AppKit
import GameplayKit

public class PHKPlayer: NSObject, GKGameModelPlayer {
    public var playerId: Int
    public var name: String
    public var fill: NSColor
    public var stroke: NSColor
    public init(_ name: String, id: Int,
                fill: NSColor, stroke: NSColor = .white) {
        self.playerId = id
        self.name = name
        self.fill = fill
        self.stroke = stroke
    }

    override public var description: String {
        return name
    }
}

extension PHKPlayer {
    public static let p1 = PHKPlayer(.player1Name, id: 1, fill: .player1)
    public static let p2 = PHKPlayer(.player2Name, id: 2, fill: .player2)
    public static let no = PHKPlayer(
        "Nobody", id: -1, fill: .white, stroke: .strokeDark
    )

    public var opponent: PHKPlayer {
        switch self {
        case .p1: return .p2
        case .p2: return .p1
        default : return .no
        }
    }
}
