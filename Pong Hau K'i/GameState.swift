public class GameState: GKState {
    public weak var model: PHKModel?

    public override init() {
        super.init()
    }

    public init(_ model: PHKModel) {
        super.init()
        self.model = model
    }
}

// TODO: Separate

public class GamePlayingState: GameState {
    override public func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is GameEndedState.Type,
             is GamePlayingState.Type:
            return true
        default:
            return false
        }
    }

    public override func didEnter(from previousState: GKState?) {
        switch previousState {
        case is GameNotStartedState:
            // Configure first player
            break
        case is GamePlayingState:
            // Start new term
            stateMachine?.enter(GameEndedState.self)
            break
        default:
            return
        }
    }
}


