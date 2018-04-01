import SpriteKit

extension SKAction {
    public static let hint = SKAction.repeatForever(
        SKAction.sequence([
            SKAction.group([
                SKAction.scale(by: 1.05, duration: 0.8),
                SKAction.fadeAlpha(by: -0.3, duration: 0.8)
            ]),
            SKAction.group([
                SKAction.scale(to: .piece, duration: 1),
                SKAction.fadeAlpha(by: 0.3, duration: 1)
            ])
        ])
    )
}
