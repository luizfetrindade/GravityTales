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

        let spriteComponent = SpriteComponent(imageNamed: "player1")
        self.addComponent(spriteComponent)
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Hero, contact: PhysicsCategory.Enemy, collision: PhysicsCategory.All, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
        
        let bounceComponent = BounceComponent(restitution: 0.5, physicsComponent: physicsComponent)
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
