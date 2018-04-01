import GameplayKit

public class GameEndedState: GameState {
    override public func isValidNextState(_ stateClass: AnyClass) -> Bool {
        return stateClass is GameNotStartedState.Type
    }

    public override func didEnter(from previousState: GKState?) {
        switch previousState {
        case is GameSwapPieceState:
            if let player = model?.currentPlayer {
                alert("Player \(player.name) LOST!")
            }
            fallthrough
        case is GameEndedState:
            // TODO: Present Confirmation
            let alert = NSAlert.init()
            alert.messageText = "Do you want to start another game?"
            alert.showsSuppressionButton = true
            switch alert.runModal() {
            case NSApplication.ModalResponse.OK:
                stateMachine?.enter(GameNotStartedState.self)
            default:
                return
            }
        default:
            return
        }
    }
}
