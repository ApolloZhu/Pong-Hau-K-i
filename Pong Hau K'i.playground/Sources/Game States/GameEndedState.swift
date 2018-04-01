import GameplayKit

public class GameEndedState: GameState {
    override public func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameStartNewState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        switch previousState {
        case is GamePlayingState:
            if let player = model?.currentPlayer {
                alert("Player \(player.name) LOST!")
            }
            fallthrough
        case is GameEndedState:
            // TODO: Present Confirmation
            stateMachine?.enter(GameStartNewState.self)
        default:
            break
        }
    }
}