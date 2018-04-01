import SpriteKit
import AppKit

public func alert(_ string: String) {
    let alert = NSAlert()
    alert.messageText = string
    alert.runModal()
}

#if canImport(PlaygroundSupport)
import PlaygroundSupport

public func newGame() {
    let sceneView = SKView(frame: .standard)
    let scene = PHKScene(size: .standard)
    sceneView.presentScene(scene)
    PlaygroundPage.current.liveView = sceneView
}
#endif
