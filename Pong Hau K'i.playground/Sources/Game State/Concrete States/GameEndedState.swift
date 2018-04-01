import GameplayKit

public class GameEndedState: GameState {
    override public func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is GameNotStartedState.Type,
             is GameEndedState.Type:
            return true
        default:
            return false
        }
    }

    public override func didEnter(from previousState: GKState?) {
        switch previousState {
        case is GameSwapPieceState:
            if let player = model?.currentPlayer {
                alert("Player \(player.name) LOST!")
            }
            fallthrough
        case is GameEndedState:
            let alert = NSAlert()
            alert.addButton(withTitle: "OK")
            alert.addButton(withTitle: "Cancel")
            alert.messageText = "Do you want to start another game?"
            if alert.runModal() == .alertFirstButtonReturn {
                stateMachine?.enter(GameNotStartedState.self)
            }
        default:
            return
        }
    }
}
