import SpriteKit

extension SKAction {
    public static let hint = SKAction.repeatForever(
        SKAction.sequence([
            SKAction.group([
                SKAction.scale(by: 1.05, duration: 0.8),
                SKAction.fadeAlpha(by: -0.3, duration: 0.8)
                ]),
            SKAction.resetPiece(in: 1)
        ])
    )

    public static func resetPiece(in time: TimeInterval) -> SKAction {
        return SKAction.group([
            SKAction.scale(to: .piece, duration: time),
            SKAction.fadeAlpha(to: 1, duration: time)
        ])
    }
}
