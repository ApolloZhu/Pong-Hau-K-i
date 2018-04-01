import GameplayKit

public class GameState: GKState {
    public weak var scene: PHKScene?
    public var model: PHKModel? {
        return scene?.model
    }

    public override init() {
        super.init()
    }

    public init(_ scene: PHKScene) {
        super.init()
        self.scene = scene
    }
}
