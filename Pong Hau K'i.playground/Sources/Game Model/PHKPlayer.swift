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
    public static let p1 = PHKPlayer("Red", id: 1, fill: .player1)
    public static let p2 = PHKPlayer("Green", id: 2, fill: .player2)
    public static let no = PHKPlayer(
        "Nobody", id: -1, fill: .white, stroke: .strokeDark
    )
}
