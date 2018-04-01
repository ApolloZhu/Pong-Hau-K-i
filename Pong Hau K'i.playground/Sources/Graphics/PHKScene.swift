import SpriteKit
import GameplayKit

public class PHKScene: SKScene {
    lazy var stateMachine = GKStateMachine(states: [
        GameNotStartedState(self),
        GamePieceSelectedState(self),
        GameMoveValidationState(self),
        GameInvalidMoveState(self),
        GameSwapPieceState(self),
        GameIdelState(self),
        GameEndedState(self)
        ])

    public private(set) lazy var model: PHKModel = {
        ai?.gameModel = $0
        print("wow, AI")
        return $0
    }(PHKModel())
    
    private(set) lazy var buttons: [SKShapeNode] = {
        return (0..<5).map {
            let node = PHKPiece(circleOfRadius: .r)
            node.name = "\($0)"
            node.position = cgCenters[$0]
            node.lineWidth = 5
            node.fillColor = model.board[$0].fill
            node.strokeColor = model.board[$0].stroke
            return node
        }
    }()
    
    private(set) lazy var lines: SKShapeNode = {
        var points = [0,4,1,0,3,1].map { cgCenters[$0] }
        let lines = SKShapeNode(
            points: &points, count: points.count
        )
        lines.lineJoin = .round
        lines.lineCap = .round
        lines.lineWidth = 10
        lines.strokeColor = .white
        return lines
    }()

    override public func didMove(to view: SKView) {
        super.didMove(to: view)
        scaleMode = .aspectFit
        backgroundColor = .background
        guard lines.parent == nil else { return }
        addChild(lines)
        buttons.forEach { addChild($0) }
        stateMachine.enter(GameNotStartedState.self)
    }

    override public func mouseDown(with event: NSEvent) {
        if stateMachine.currentState is GameEndedState {
            stateMachine.enter(GameEndedState.self)
            return
        }

        let point = event.location(in: self)
        for node in nodes(at: point) {
            guard let piece = node as? PHKPiece
                else { continue }
            model.selected = piece.id
            stateMachine.enter(
                GamePieceSelectedState.self
            )
            return
        }
    }
}
