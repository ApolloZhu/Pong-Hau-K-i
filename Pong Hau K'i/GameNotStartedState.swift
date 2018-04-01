import GameplayKit

public class GameNotStartedState: GameState {
    override public func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GamePlayingState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        // TODO: Show some tips and animations
    }
}
