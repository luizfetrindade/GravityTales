//
//  Wall.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/2/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Wall: GKEntity {
    
    override init() {
        super.init()
        
        let spriteComponent = SpriteComponent(imageNamed: "wall")
        self.addComponent(spriteComponent)
        
        let rotationComponent = RotationComponent(rotation: 0, spriteComponent: spriteComponent)
        self.addComponent(rotationComponent)
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Wall, contact: PhysicsCategory.None, collision: PhysicsCategory.All, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
    }
    
    init(rotation: CGFloat) {
        super.init()
        
        let spriteComponent = SpriteComponent(imageNamed: "wall")
        self.addComponent(spriteComponent)
        
        let rotationComponent = RotationComponent(rotation: rotation, spriteComponent: spriteComponent)
        self.addComponent(rotationComponent)
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Wall, contact: PhysicsCategory.None, collision: PhysicsCategory.All, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
