import GameplayKit

public enum PHKInvalidMove: Error {
    case empty, unowned, notMovable
}

public class GameInvalidMoveState: GameState {
    public override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameIdelState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        let message: String
        switch model?.error {
        case .empty?:
            message = "You selected the empty spot"
        case .unowned?:
            message = "You can't your opponent's piece"
        case .notMovable?:
            message = "It can't be moved to the empty spot"
        default: message = "Something went wrong"
        }
        alert(message, "Please select one of your other pieces instead!")
        stateMachine?.enter(GameIdelState.self)
    }
}
