//
//  RotationComponent.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/5/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class RotationComponent: GKComponent {
    
    let node: SKNode
    var rotation: CGFloat
    let allowsRotation: Bool
    
    init(rotation: CGFloat, spriteComponent: SpriteComponent) {
        self.node = spriteComponent.spriteNode
        self.rotation = rotation
        self.allowsRotation = false
        super.init()
        spriteComponent.spriteNode.zRotation = rotation
    }
    
    init(rotation: CGFloat, spriteComponent: SpriteComponent, physicsComponent: PhysicsComponent) {
        self.node = spriteComponent.spriteNode
        self.rotation = rotation
        self.allowsRotation = true
        super.init()
        spriteComponent.spriteNode.zRotation = rotation
        physicsComponent.physicsBody.allowsRotation = true
    }
    
    func rotate(direction: String) {
        if direction == "left" {
            node.zRotation = -CGFloat(Double.pi/2)
        } else if direction == "right" {
            node.zRotation = CGFloat(Double.pi/2)
        } else if direction == "up" {
            node.zRotation = -CGFloat(Double.pi)
        } else if direction == "down" {
            node.zRotation = 0.0
        } else { fatalError("Direction is wrong") }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
