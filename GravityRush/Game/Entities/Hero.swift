//
//  Hero.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/2/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Hero: GKEntity {
    override init() {
        super.init()

        let spriteComponent = SpriteComponent(imageName: "player1")
        self.addComponent(spriteComponent)
        
        let rotationComponent = RotationComponent(rotation: 0, spriteComponent: spriteComponent)
        self.addComponent(rotationComponent)
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Hero, contact: PhysicsCategory.Enemy | PhysicsCategory.Exit | PhysicsCategory.Button, collision: PhysicsCategory.Wall | PhysicsCategory.Box, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
        
        let bounceComponent = BounceComponent(restitution: 0.1, physicsComponent: physicsComponent)
        self.addComponent(bounceComponent)
        
        let weightComponent = WeightComponent(physicsComponent: physicsComponent)
        self.addComponent(weightComponent)
        
        let moveComponent = MoveComponent(node: spriteComponent.spriteNode, timeOffset: 3)
        self.addComponent(moveComponent)
        
        
        let jumpComponent = JumpComponent(node: spriteComponent.spriteNode, strength: 2)
        self.addComponent(jumpComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
