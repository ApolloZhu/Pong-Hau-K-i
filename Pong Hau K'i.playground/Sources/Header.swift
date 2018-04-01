import SpriteKit
import AppKit

public func alert(_ string: String) {
    let alert = NSAlert()
    alert.messageText = string
    alert.runModal()
}

#if canImport(PlaygroundSupport)
import PlaygroundSupport
#endif

public func newGame() {
    let sceneView = SKView(frame: .standard)
    let scene = PHKScene(size: .standard)
    sceneView.presentScene(scene)
    #if canImport(PlaygroundSupport)
    PlaygroundPage.current.liveView = sceneView
    #else
    let view = (NSApplication.shared.keyWindow?.contentViewController as? ViewController)?.skView.presentScene(scene, transition: SKTransition.push(with: .up, duration: 1))
    #endif
}
