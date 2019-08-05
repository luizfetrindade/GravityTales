//
//  Box.swift
//  GravityRush
//
//  Created by Fernando Locatelli Maioli on 02/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Box: GKEntity {
    override init() {
        super.init()
        
        let spriteComponent = SpriteComponent(imageNamed: "box")
        self.addComponent(spriteComponent)
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Wall, contact: PhysicsCategory.None, collision: PhysicsCategory.All, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
        
        let rotationComponent = RotationComponent(rotation: 0, spriteComponent: spriteComponent, physicsComponent: physicsComponent)
        self.addComponent(rotationComponent)
        
        let bounceComponent = BounceComponent(restitution: 0.5, physicsComponent: physicsComponent)
        self.addComponent(bounceComponent)
        
        let weightComponent = WeightComponent(physicsComponent: physicsComponent)
        self.addComponent(weightComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
