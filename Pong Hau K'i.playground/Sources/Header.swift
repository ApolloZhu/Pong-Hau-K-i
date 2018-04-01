import AppKit
import GameplayKit
import SpriteKit

public func alert(_ message: String, _ info: String? = nil) {
    let alert = NSAlert()
    alert.messageText = message
    if let info = info {
        alert.informativeText = info
    }
    alert.runModal()
}

#if canImport(PlaygroundSupport)
import PlaygroundSupport
#endif

public func newGame(ai: (strategist: GKStrategist, goFirst: Bool)? = nil) {
    let scene = PHKScene(size: .standard)
    scene.model.ai = ai
    #if canImport(PlaygroundSupport)
    let sceneView = SKView(frame: .standard)
    sceneView.presentScene(scene)
    PlaygroundPage.current.liveView = sceneView
    #else
    // scene.model.ai = (strategist: GKMinmaxStrategist(), goFirst: true)
    (NSApplication.shared.keyWindow?.contentViewController as? ViewController)?.skView.presentScene(scene, transition: SKTransition.push(with: .up, duration: 1))
    #endif
}
