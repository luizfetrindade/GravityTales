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
    
    var rotation: CGFloat
    let allowsRotation: Bool
    
    init(rotation: CGFloat, spriteComponent: SpriteComponent) {
        self.rotation = rotation
        self.allowsRotation = false
        super.init()
        spriteComponent.spriteNode.zRotation = rotation
    }
    
    init(rotation: CGFloat, spriteComponent: SpriteComponent, physicsComponent: PhysicsComponent) {
        self.rotation = rotation
        self.allowsRotation = true
        super.init()
        spriteComponent.spriteNode.zRotation = rotation
        physicsComponent.physicsBody.allowsRotation = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
