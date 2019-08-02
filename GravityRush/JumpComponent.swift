//
//  JumpComponent.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/2/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class JumpComponent: GKComponent {
    let node: SKNode
    let strength: Double
    
    init(node: SKNode, strength: Double) {
        self.node = node
        self.strength = strength
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
    
    func jump() {
        node.physicsBody?.applyForce(CGVector(dx: 0, dy: strength))
    }
}
