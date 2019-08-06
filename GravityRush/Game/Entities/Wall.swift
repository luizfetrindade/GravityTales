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
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Wall, contact: PhysicsCategory.None, collision: PhysicsCategory.All, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
    }
    
    init(imageName: String) {
        super.init()
        
        let spriteComponent = SpriteComponent(imageNamed: imageName)
        self.addComponent(spriteComponent)
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Wall, contact: PhysicsCategory.None, collision: PhysicsCategory.All, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
