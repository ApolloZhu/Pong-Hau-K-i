//
//  ViewController.swift
//  Pong Hau K'i
//
//  Created by Apollo Zhu on 4/1/18.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {
    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = PHKScene(size: .standard)
        // scene.model.ai = (strategist: GKMinmaxStrategist(), goFirst: true)
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
    }
}

