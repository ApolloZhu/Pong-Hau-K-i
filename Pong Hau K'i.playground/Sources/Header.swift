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

public func newGame(ai strategist: GKStrategist? = nil) {
    let scene = PHKScene(size: .standard)
    strategist?.gameModel = scene.model
    #if canImport(PlaygroundSupport)
    let sceneView = SKView(frame: .standard)
    sceneView.presentScene(scene)
    PlaygroundPage.current.liveView = sceneView
    #else
    (NSApplication.shared.keyWindow?.contentViewController as? ViewController)?.skView.presentScene(scene, transition: SKTransition.push(with: .up, duration: 1))
    #endif
}
