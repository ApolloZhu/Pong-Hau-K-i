import SpriteKit
import GameplayKit

public class PHKScene: SKScene {
    lazy var stateMachine = GKStateMachine(states: [
        GameNotStartedState(),
        GamePlayingState(model),
        GameEndedState(model),
        GameStartNewState()
        ])

    public let model = PHKModel()
    
    private lazy var buttons: [SKShapeNode] = {
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
    
    private lazy var lines: SKShapeNode = {
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

    var selectedID: Int = -1
    
    override public func mouseDown(with event: NSEvent) {
        switch stateMachine.currentState {
        case is GameNotStartedState:
            stateMachine.enter(GamePlayingState.self)
        case is GamePlayingState:
            let point = event.location(in: self)
            for node in nodes(at: point) {
                if let piece = node as? PHKPiece {
                    selectedID = piece.id
                    stateMachine.enter(
                        GamePlayingState.self
                    )
                    return
                }
            }
        case is GameEndedState:
            stateMachine.enter(GameEndedState.self)
        default:
            return
        }
    }
    
    private func didSelect(_ id: Int) {
        if id == model.emptySpot {
            return alert("You selected the empty spot."
                + "Please select one of your own pieces instead!")
        }
        if model.currentPlayer == PHKPlayer.no {
            model.currentPlayer = model.board[id]
        } else {
            guard model.board[id] == model.currentPlayer else {
                return alert(
                    "You can't control that piece!"
                )
            }
        }
        guard model.isEmptySpotAccessible(from: id) else {
            return alert(
                "It can't be moved to the empty spot!"
            )
        }
        swap(id, model.emptySpot)
        nextTurn()
    }
    
    private func swap(_ lhs: Int, _ rhs: Int) {
        model.board.swapAt(lhs, rhs)
        buttons[lhs].fillColor = model.board[lhs].fill
        buttons[lhs].strokeColor = model.board[lhs].stroke
        buttons[rhs].fillColor = model.board[rhs].fill
        buttons[rhs].strokeColor = model.board[rhs].stroke
    }
    
    private func nextTurn() {
        model.currentPlayer = model.currentPlayer == .p1 ? .p2 : .p1
        for (id, state) in model.board.enumerated() {
            if state == model.currentPlayer
                , model.isEmptySpotAccessible(from: id) {
                return
            }
        }
        stateMachine.enter(GameEndedState.self)
    }
}
